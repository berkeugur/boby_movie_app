import 'package:boby_movie_app/features/onboarding/data/repositories/genres_reposityory_impl.dart';
import 'package:boby_movie_app/features/onboarding/presentation/viewmodels/genres_store.dart';
import 'package:boby_movie_app/features/onboarding/presentation/widgets/genre_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:boby_movie_app/bootstrap/di_container.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

class OnboardingGenresScreen extends StatefulWidget {
  const OnboardingGenresScreen({super.key});

  @override
  State<OnboardingGenresScreen> createState() => _OnboardingGenresScreenState();
}

class _OnboardingGenresScreenState extends State<OnboardingGenresScreen> {
  late final GenresStore genresStore;
  late ScrollController _scrollController;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    genresStore = GenresStore(getIt.get<GenresRepositoryImpl>());
    genresStore.fetchGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Observer(
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (genresStore.numOfselectedGenre == 2) Text("Continue to next step 👉", style: Theme.of(context).textTheme.titleLarge),
                            if (genresStore.numOfselectedGenre == 2) Text(" ", style: Theme.of(context).textTheme.titleMedium),
                            if (genresStore.numOfselectedGenre != 2) Text("Welcome", style: Theme.of(context).textTheme.titleLarge),
                            if (genresStore.numOfselectedGenre != 2)
                              Text("Choose your 2 favorite genres", style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      );
                    },
                  ),

                  Expanded(
                    child: Observer(
                      builder: (_) {
                        if (genresStore.isLoading) {
                          return GridView.builder(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 18,
                              crossAxisSpacing: 58,
                            ),
                            itemCount: 16, // Örnek skeleton sayısı
                            itemBuilder: (context, index) {
                              return Container(margin: const EdgeInsets.only(bottom: 18), child: GenreCard.loading());
                            },
                          );
                        }
                        return AnimationLimiter(
                          child: GridView.builder(
                            controller: _scrollController,
                            padding: EdgeInsets.only(left: 18, right: 18, top: MediaQuery.of(context).size.height * 0.15),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 18,
                              crossAxisSpacing: 58,
                            ),
                            itemCount: genresStore.genres.length,
                            itemBuilder: (context, index) {
                              final genre = genresStore.genres[index];
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 18),
                                      child: GenreCard(
                                        genre: genre,
                                        isLoading: false,
                                        isSelected: genresStore.isGenresSelected(genre),
                                        onTap: () {
                                          if (genresStore.isGenresSelected(genre) && genresStore.numOfselectedGenre == 2) {
                                            genresStore.toggleFavoriteGenres(genre);
                                          } else if (genresStore.numOfselectedGenre < 2) {
                                            genresStore.toggleFavoriteGenres(genre);
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text("You can only select 2 genres"), duration: const Duration(seconds: 2)),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Observer(
              builder: (context) {
                return Container(
                  color: Colors.transparent,
                  margin: EdgeInsets.only(left: 18, right: 18, bottom: MediaQuery.of(context).size.height * 0.05),
                  child: FilledButton(
                    onPressed: genresStore.numOfselectedGenre != 2 ? null : () => context.push('/paywall'),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Text("Continue")],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
