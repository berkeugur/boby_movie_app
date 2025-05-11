import 'package:boby_movie_app/core/theme/app_theme.dart';
import 'package:boby_movie_app/features/paywall/presentation/widgets/bottom_buttons.dart';
import 'package:boby_movie_app/features/paywall/presentation/widgets/features_widget.dart';
import 'package:boby_movie_app/features/paywall/presentation/widgets/free_trial_switch_widget.dart';
import 'package:boby_movie_app/features/paywall/presentation/widgets/payment_period_widget.dart';
import 'package:boby_movie_app/features/paywall/presentation/widgets/unlock_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  bool isFreeTrialEnabled = true;
  PaywallPeriodState selectedPaywallPeriodState = PaywallPeriodState.weekly;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text('AppName'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            FeaturesWidget(
              paywallState:
                  isFreeTrialEnabled ? PaywallPeriodState.yearly : selectedPaywallPeriodState,
            ),
            FreeTrialSwitchWidget(
              onChanged: (p0) {
                setState(() {
                  isFreeTrialEnabled = p0;
                });
              },
              isFreeTrialEnabled: isFreeTrialEnabled,
            ),
            PaymentPeriodWidget(
              selectedPaywallPeriodState:
                  isFreeTrialEnabled ? PaywallPeriodState.yearly : selectedPaywallPeriodState,
              onChanged: (value) {
                switch (value) {
                  case PaywallPeriodState.weekly:
                    setState(() {
                      selectedPaywallPeriodState = PaywallPeriodState.weekly;
                    });
                    break;
                  case PaywallPeriodState.monthly:
                    setState(() {
                      selectedPaywallPeriodState = PaywallPeriodState.monthly;
                    });
                    break;
                  case PaywallPeriodState.yearly:
                    setState(() {
                      selectedPaywallPeriodState = PaywallPeriodState.yearly;
                    });
                    break;
                }
              },
            ),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Icon(Icons.security, color: Colors.green, size: 16),
                Text("Auto Renewable, Cancel Anytime", style: TextStyle(fontSize: 12)),
              ],
            ),
            SizedBox(height: 16),
            UnlockButton(
              unlockText: isFreeTrialEnabled ? "3 Days Free\nNo Payment Now" : "Unlock MovieAI PRO",
              isEnableAnimation: isFreeTrialEnabled,
              onPressed: () {
                /*
                if (isFreeTrialEnabled) {
                  // Start free trial
                } else {
                  // Unlock now
                } */

                context.push("/home");
              },
            ),
            SizedBox(height: 16),
            BottomButtons(
              onTermsOfServicePressed: () {},
              onPrivacyPolicyPressed: () {},
              onRestorePressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
