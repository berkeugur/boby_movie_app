import 'package:boby_movie_app/core/theme/app_theme.dart';
import 'package:boby_movie_app/features/onboarding/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isLoading;

  const MovieCard({required this.movie, required this.isSelected, required this.onTap, super.key, required this.isLoading});

  factory MovieCard.loading() {
    return MovieCard(movie: MovieEntity(id: 0, title: "Loading", posterPath: "", overview: ""), isSelected: false, onTap: () {}, isLoading: true);
  }
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: AppTheme.white.withValues(alpha: 0.4),
        highlightColor: AppTheme.white.withValues(alpha: 0.6),
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(height: 300, width: 300, color: AppTheme.white.withValues(alpha: 0.1)),
          ),
        ),
      );
    }
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: RotatedBox(
        quarterTurns: 1,
        child: Stack(
          children: [
            Container(
              height: 280,
              width: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                ),
              ),
            ),
            if (isSelected)
              Container(
                height: 280,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: RadialGradient(colors: [Colors.transparent, Colors.red.withValues(alpha: 0.9)], radius: 0.6),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CircleAvatar(backgroundColor: AppTheme.redLight, child: Icon(Icons.done, size: 20, color: AppTheme.white)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
