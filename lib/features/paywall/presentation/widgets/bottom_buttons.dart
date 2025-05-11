import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key, required this.onTermsOfServicePressed, required this.onPrivacyPolicyPressed, required this.onRestorePressed});

  final void Function() onTermsOfServicePressed;
  final void Function() onPrivacyPolicyPressed;
  final void Function() onRestorePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: onTermsOfServicePressed, child: const Text('Terms of Use', style: TextStyle(fontSize: 12))),
        TextButton(onPressed: onRestorePressed, child: const Text('Restore Purchase', style: TextStyle(fontSize: 12))),
        TextButton(onPressed: onPrivacyPolicyPressed, child: const Text('Privacy Policy', style: TextStyle(fontSize: 12))),
      ],
    );
  }
}
