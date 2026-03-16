import 'package:flutter/material.dart';

class NoInternetView extends StatelessWidget {
  final VoidCallback? onRetry;
  final String title;
  final String message;
  final Widget? illustration;
  final String retryText;

  const NoInternetView({
    super.key,
    this.onRetry,
    this.title = 'No Internet Connection',
    this.message =
        'Please check your Wi-Fi or mobile data. Your device is currently offline.',
    this.illustration,
    this.retryText = 'Retry',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (illustration != null) ...[
              SizedBox(
                height: 180,
                child: illustration!,
              ),
              const SizedBox(height: 20),
            ] else ...[
              Icon(
                Icons.wifi_off_rounded,
                size: 90,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 20),
            ],
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(retryText),
            ),
          ],
        ),
      ),
    );
  }
}
