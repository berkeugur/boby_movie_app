import 'package:boby_movie_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum PaywallPeriodState { weekly, monthly, yearly }

class PaymentPeriodWidget extends StatelessWidget {
  const PaymentPeriodWidget({super.key, required this.selectedPaywallPeriodState, required this.onChanged});
  final PaywallPeriodState selectedPaywallPeriodState;

  final Function(PaywallPeriodState) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PeriodItem(
          context,
          title: "Weekly",
          subtitle: "Only \$4,99 per week",
          price: "\$4.99 / week",
          paywallPeriodState: PaywallPeriodState.weekly,
          isBestValue: false,
        ),
        const SizedBox(height: 8),
        PeriodItem(
          context,
          title: "Monthly",
          subtitle: "Only \$14,99 per month",
          price: "\$14.99 / month",
          paywallPeriodState: PaywallPeriodState.monthly,
          isBestValue: false,
        ),
        const SizedBox(height: 8),
        PeriodItem(
          context,
          title: "Yearly",
          subtitle: "Only \$99,99 per year",
          price: "\$99.99 / year",
          paywallPeriodState: PaywallPeriodState.yearly,
          isBestValue: true,
        ),
      ],
    );
  }

  GestureDetector PeriodItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String price,
    required PaywallPeriodState paywallPeriodState,
    required bool isBestValue,
  }) {
    return GestureDetector(
      onTap: () {
        onChanged(paywallPeriodState);
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              border:
                  selectedPaywallPeriodState == paywallPeriodState
                      ? Border.all(color: AppTheme.redLight, width: 2)
                      : Border.all(color: AppTheme.greyLight, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedPaywallPeriodState == paywallPeriodState
                    ? Icon(Icons.check_circle, color: AppTheme.redLight)
                    : Icon(Icons.circle_outlined, color: AppTheme.redLight),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(subtitle, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppTheme.greyLight)),
                    ],
                  ),
                ),
                Text(price, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          if (isBestValue)
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width / 2 - 60,
              right: MediaQuery.of(context).size.width / 2 - 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.redLight,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Text("Best Value", style: TextStyle(color: AppTheme.white, fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
