import 'package:boby_movie_app/features/onboarding/data/repositories/movie_repository_impl.dart';
import 'package:boby_movie_app/features/onboarding/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:boby_movie_app/bootstrap/di_container.dart';
import 'package:boby_movie_app/features/onboarding/presentation/viewmodels/movie_store.dart';
import 'package:go_router/go_router.dart';

class OnboardingMoviesScreen extends StatefulWidget {
  const OnboardingMoviesScreen({super.key});

  @override
  State<OnboardingMoviesScreen> createState() => _OnboardingMoviesScreenState();
}

class _OnboardingMoviesScreenState extends State<OnboardingMoviesScreen> {
  late final MovieStore movieStore;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieStore = MovieStore(getIt.get<MovieRepositoryImpl>());
    movieStore.fetchMovies().then((_) {
      _scrollController.jumpTo(200);
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && !movieStore.isLoading) {
        movieStore.fetchMovies();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Observer(
          builder: (context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              child: FilledButton(
                onPressed:
                    movieStore.numOfselectedMovie != 3
                        ? null
                        : () {
                          context.push('/onboarding-genres');
                        },
                child: Padding(padding: const EdgeInsets.all(8.0), child: Text("Continue")),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Center(
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
                        if (movieStore.numOfselectedMovie == 3) Text("Continue to next step 👉", style: Theme.of(context).textTheme.titleLarge),
                        if (movieStore.numOfselectedMovie == 3) Text(" ", style: Theme.of(context).textTheme.titleMedium),
                        if (movieStore.numOfselectedMovie != 3) Text("Welcome", style: Theme.of(context).textTheme.titleLarge),
                        if (movieStore.numOfselectedMovie != 3) Text("Choose your 3 favorite movies", style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  );
                },
              ),
              Expanded(
                child: Observer(
                  builder: (_) {
                    if (movieStore.isLoading) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: ListWheelScrollView.useDelegate(
                            itemExtent: 200,
                            perspective: 0.0005,
                            diameterRatio: 1.5,
                            controller: ScrollController(initialScrollOffset: 200),
                            physics: const BouncingScrollPhysics(),
                            childDelegate: ListWheelChildBuilderDelegate(
                              childCount: 15,
                              builder: (context, index) {
                                return MovieCard.loading();
                              },
                            ),
                          ),
                        ),
                      );
                    }
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 200,
                          perspective: 0.0005,
                          diameterRatio: 1.5,
                          controller: _scrollController,
                          physics: const BouncingScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            // Handle item selection if needed
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: movieStore.movies.length,
                            builder: (context, index) {
                              final movie = movieStore.movies[index];
                              return MovieCard(
                                isLoading: false,
                                movie: movie,
                                isSelected: movieStore.isMovieSelected(movie),
                                onTap: () {
                                  if (movieStore.favoriteMovies.contains(movie)) {
                                    movieStore.toggleFavoriteMovies(movie);
                                  } else {
                                    if (movieStore.favoriteMovies.length == 3) {
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("You can only select 3 movies")));
                                      return;
                                    }
                                    movieStore.toggleFavoriteMovies(movie);
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
