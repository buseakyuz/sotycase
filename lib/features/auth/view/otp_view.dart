import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import '../providers/auth_notifier.dart';
import '../../../../product/constants/soty_colors.dart';

class OtpView extends ConsumerStatefulWidget {
  final String phone;
  const OtpView({super.key, required this.phone});

  @override
  ConsumerState<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends ConsumerState<OtpView> {
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  Future<void> _onVerify() async {
    if (_pinController.text.length < 6) return;

    final success = await ref.read(authProvider.notifier).verifyCode(
          widget.phone,
          _pinController.text,
        );

    if (success && mounted) {
      context.go('/wallet');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: SotyColors.textPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Image.asset("assets/logo/sotylogo.png", height: 120),
              const SizedBox(height: 40),
              Text(
                'Doğrulama Kodu',
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: SotyColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.phone} numaralı telefona gönderilen kodu giriniz.',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: SotyColors.textSecondary,
                ),
              ),
              const SizedBox(height: 40),
              Pinput(
                length: 6,
                controller: _pinController,
                onCompleted: (_) => _onVerify(),
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 56,
                  textStyle: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: BoxDecoration(
                    color: SotyColors.lightGray,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 50,
                  height: 56,
                  textStyle: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: SotyColors.primary, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              if (authState.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    authState.errorMessage!,
                    style: TextStyle(color: SotyColors.error, fontWeight: FontWeight.w500),
                  ),
                ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: authState.isLoading ? null : _onVerify,
                  child: authState.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Doğrula'),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kod gelmedi mi? ',
                    style: textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: authState.remainingTime > 0 ? null : () => ref.read(authProvider.notifier).resendCode(),
                    child: Text(
                      authState.remainingTime > 0
                          ? 'Tekrar Gönder (${authState.remainingTime}s)'
                          : 'Tekrar Gönder',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: authState.remainingTime > 0 ? Colors.grey : SotyColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
