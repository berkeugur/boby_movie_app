import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FreeTrialSwitchWidget extends StatelessWidget {
  const FreeTrialSwitchWidget({super.key, this.onChanged, required this.isFreeTrialEnabled});

  final Function(bool)? onChanged;
  final bool isFreeTrialEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18, top: 18),
      decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text("Enable Free Trial", style: Theme.of(context).textTheme.titleMedium)),
          const SizedBox(width: 8),
          CupertinoSwitch(value: isFreeTrialEnabled, onChanged: onChanged),
        ],
      ),
    );
  }
}
