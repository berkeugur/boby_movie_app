import 'package:boby_movie_app/core/theme/app_theme.dart';
import 'package:boby_movie_app/features/paywall/presentation/widgets/payment_period_widget.dart';
import 'package:flutter/material.dart';

class FeaturesWidget extends StatelessWidget {
  const FeaturesWidget({super.key, required this.paywallState});
  final PaywallPeriodState paywallState;

  @override
  Widget build(BuildContext context) {
    const List<String> features = ["", "Daily Movie Suggestions", "AI-Powered Movie Insights", "Personalized Watchlist", "Ad-Free Experience"];
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: Column(
            spacing: 18,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(features.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(features[index], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              );
            }),
          ),
        ),
        Column(
          spacing: 8,
          children: [
            SizedBox(height: 4),

            Text("FREE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 4),

            ActiveWidget(),
            SizedBox(height: 4),

            InactiveWidget(),
            SizedBox(height: 4),

            InactiveWidget(),
            SizedBox(height: 4),

            InactiveWidget(),
            SizedBox(height: 4),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(border: Border.all(color: AppTheme.redLight, width: 2), borderRadius: BorderRadius.circular(12)),
          child: Column(
            spacing: 8,
            children: [
              SizedBox(height: 3),

              Container(
                width: 12,
                height: 1,
                decoration: BoxDecoration(
                  color: AppTheme.redLight,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: AppTheme.redLight, blurRadius: 6, spreadRadius: 2, offset: const Offset(0, 0))],
                ),
                margin: EdgeInsets.only(bottom: 2),
              ),
              Text("PRO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, height: -0.1)),
              Container(
                width: 12,
                height: 1,
                decoration: BoxDecoration(
                  color: AppTheme.redLight,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: AppTheme.redLight, blurRadius: 6, spreadRadius: 2, offset: const Offset(0, 0))],
                ),
                margin: EdgeInsets.only(top: 2),
              ),
              SizedBox(height: 3),

              ActiveWidget(),
              SizedBox(height: 4),
              ActiveWidget(),
              SizedBox(height: 4),

              if (paywallState == PaywallPeriodState.weekly) InactiveWidget(),
              if (paywallState == PaywallPeriodState.monthly || paywallState == PaywallPeriodState.yearly) ActiveWidget(),

              SizedBox(height: 4),

              if (paywallState == PaywallPeriodState.monthly || paywallState == PaywallPeriodState.weekly) InactiveWidget(),
              if (paywallState == PaywallPeriodState.yearly) ActiveWidget(),
              SizedBox(height: 4),
            ],
          ),
        ),
      ],
    );
  }
}

class ActiveWidget extends StatelessWidget {
  const ActiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.green[400], shape: BoxShape.circle),
      child: Icon(Icons.done, color: AppTheme.black, size: 18),
    );
  }
}

class InactiveWidget extends StatelessWidget {
  const InactiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Icon(Icons.close, color: AppTheme.black, size: 18),
    );
  }
}
