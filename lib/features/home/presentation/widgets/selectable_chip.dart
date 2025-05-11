import 'package:boby_movie_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SelectableChip extends StatelessWidget {
  const SelectableChip({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onSelected,
  });
  final String text;
  final bool isSelected;
  final void Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      child: Chip(
        label:
            !isSelected
                ? Text(text)
                : Row(
                  spacing: 2,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.done, color: AppTheme.white, size: 18), Text(text)],
                ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
        backgroundColor: isSelected ? AppTheme.redLight : AppTheme.white,
        labelStyle: TextStyle(color: isSelected ? AppTheme.white : AppTheme.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
          side: BorderSide(color: AppTheme.black),
        ),
      ),
    );
  }
}
