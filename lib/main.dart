import 'package:boby_movie_app/app.dart';
import 'package:boby_movie_app/bootstrap/bootstrap.dart';
import 'package:boby_movie_app/bootstrap/environment.dart';

void main() {
  AppEnvironment.env = Environment.dev;

  bootstrap(() => const App());
}
