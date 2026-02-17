import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:sotycase/features/auth/providers/auth_notifier.dart';
import 'package:sotycase/product/constants/soty_colors.dart';

class OtpView extends ConsumerStatefulWidget {
  final String? phone;
  const OtpView({super.key, this.phone});

  @override
  ConsumerState<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends ConsumerState<OtpView> {
  final _pinController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _pinController.addListener(() {
      final newIsButtonEnabled = _pinController.text.length == 6;
      if (newIsButtonEnabled != _isButtonEnabled) {
        setState(() {
          _isButtonEnabled = newIsButtonEnabled;
        });
      }
    });
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    final formattedTime =
        '00:${authState.remainingTime.toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AppBar(leading: const BackButton(color: SotyColors.textPrimary)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              'Doğrulama Kodunu Girin',
              style: TextStyle(
                color: SotyColors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${widget.phone} numaralı telefona gönderilen 6 haneli kodu girin.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
            ),
            const SizedBox(height: 40),
            Pinput(
              controller: _pinController,
              length: 6,
              autofocus: true,
              defaultPinTheme: PinTheme(
                width: 50,
                height: 55,
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 50,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(color: SotyColors.primary),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 30),
            if (authState.remainingTime > 0)
              Text(
                'Kalan Süre: $formattedTime',
                style: const TextStyle(fontSize: 16),
              )
            else
              TextButton(
                onPressed: authNotifier.resendCode,
                child: const Text(
                  'Tekrar Gönder',
                  style: TextStyle(color: SotyColors.primary),
                ),
              ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isButtonEnabled && !authState.isLoading
                    ? () async {
                        final success = await authNotifier.verifyCode(
                          _pinController.text,
                        );
                        if (success && mounted) {
                          context.go('/wallet');
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: SotyColors.primary,
                  disabledBackgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: authState.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Doğrula',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
