import 'package:boby_movie_app/core/theme/app_theme.dart';
import 'package:boby_movie_app/features/home/presentation/widgets/selectable_chip.dart';
import 'package:boby_movie_app/features/home/presentation/widgets/story_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('For You ⭐️'),
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.black,
      ),
      body: Column(
        children: [
          StorySection(),
          Divider(),
          AppBar(
            centerTitle: false,
            title: const Text('Movies 🎬'),
            backgroundColor: Colors.black,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CupertinoSearchTextField(
              backgroundColor: AppTheme.white,
              suffixMode: OverlayVisibilityMode.always,
              suffixIcon: Icon(Icons.mic),
            ),
          ),
          SizedBox(height: 9),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: 20,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SelectableChip(
                  text: 'Action $index',
                  isSelected: index == 0,
                  onSelected: (value) {
                    print(value);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Action 0",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
              ),
              itemCount: 20,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme.redLight,
                  ),
                  child: Center(child: Text('Movie $index')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
