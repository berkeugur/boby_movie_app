import 'package:boby_movie_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class StorySection extends StatelessWidget {
  const StorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 20,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 16),

            child: CircleAvatar(radius: 40, backgroundColor: AppTheme.white, child: Text('Image', style: TextStyle(color: AppTheme.black))),
          );
        },
      ),
    );
  }
}
