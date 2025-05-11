import 'dart:math';

import 'package:boby_movie_app/features/onboarding/domain/entities/genre_entity.dart';
import 'package:flutter/material.dart';
import 'package:boby_movie_app/core/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class GenreCard extends StatelessWidget {
  final GenreEntity genre;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isLoading;

  const GenreCard({super.key, required this.genre, required this.isSelected, required this.onTap, required this.isLoading});

  factory GenreCard.loading() {
    return GenreCard(genre: GenreEntity(id: 0, name: "Loading", imageUrl: ""), isSelected: false, onTap: () {}, isLoading: true);
  }

  @override
  Widget build(BuildContext context) {
    final card = Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          margin: !isLoading ? null : const EdgeInsets.only(bottom: 18),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: isSelected ? Border.all(color: AppTheme.redLight, width: 2, strokeAlign: BorderSide.strokeAlignOutside) : null,
          ),
          child:
              isLoading
                  ? Shimmer.fromColors(
                    baseColor: AppTheme.white.withValues(alpha: 0.4),
                    highlightColor: AppTheme.white.withValues(alpha: 0.6),

                    child: Container(
                      height: 20 * pi,
                      width: 20 * pi,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.white.withValues(alpha: 0.1)),
                    ),
                  )
                  : CircleAvatar(
                    backgroundColor: AppTheme.white.withValues(alpha: 0.1),
                    backgroundImage: !isLoading && genre.imageUrl.isNotEmpty ? NetworkImage(genre.imageUrl) : null,
                    radius: 20,
                  ),
        ),
        if (isSelected)
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: CircleAvatar(backgroundColor: AppTheme.redLight, radius: 14, child: Icon(Icons.done, size: 20, color: AppTheme.white)),
          ),
      ],
    );

    return isLoading ? card : GestureDetector(onTap: onTap, child: card);
  }
}
