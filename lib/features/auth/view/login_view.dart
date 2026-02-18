import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sotycase/core/constants/layout_constants.dart';
import 'package:sotycase/features/auth/providers/auth_notifier.dart';
import 'package:sotycase/product/constants/soty_colors.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final maskFormatter = MaskTextInputFormatter(
    mask: '### ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final TextEditingController _phoneController = TextEditingController();
  bool _isButtonActive = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onPhoneChanged(String value) {
    setState(() {
      _isButtonActive = maskFormatter.getUnmaskedText().length == 10;
    });
  }

  Future<void> _onContinue() async {
    if (!_isButtonActive) return;

    final phone = "90${maskFormatter.getUnmaskedText()}";

    await ref.read(authProvider.notifier).sendCode(phone);

    if (mounted) {
      context.push('/otp', extra: phone);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final errorMessage = authState.errorMessage;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: SotyColors.textPrimary),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/welcome');
            }
          },
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: LayoutConstants.highAllPadding,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      constraints.maxHeight - LayoutConstants.highSize * 2,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo/sotylogo.png", height: 200),
                      LayoutConstants.centralEmptyHeight,
                      const Text(
                        'Tekrar Hoş Geldiniz',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: SotyColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Lütfen telefon numaranız ile giriş yapınız',
                        style: TextStyle(
                          fontSize: 14,
                          color: SotyColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Container(
                            height: 56,
                            width: 70,
                            decoration: BoxDecoration(
                              color: SotyColors.lightGray,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              '+90',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: SotyColors.textSecondary,
                              ),
                            ),
                          ),
                          LayoutConstants.centralEmptyWidth,
                          Expanded(
                            child: Container(
                              height: 56,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: SotyColors.lightGray,
                                borderRadius: BorderRadius.circular(12),
                                border: errorMessage != null
                                    ? Border.all(color: SotyColors.error)
                                    : null,
                              ),
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                controller: _phoneController,
                                inputFormatters: [maskFormatter],
                                keyboardType: TextInputType.phone,
                                onChanged: _onPhoneChanged,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: SotyColors.textPrimary,
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (errorMessage != null) ...[
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            errorMessage,
                            style: const TextStyle(
                              color: SotyColors.error,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                      const Spacer(flex: 1),
                      LayoutConstants.highEmptyHeight,
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _isButtonActive ? _onContinue : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: SotyColors.primary,
                            disabledBackgroundColor: Colors.grey[300],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: authState.isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Giriş Yap',
                                  style: TextStyle(
                                    color: _isButtonActive
                                        ? Colors.white
                                        : Colors.grey[500],
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                      LayoutConstants.maxEmptyHeight,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
