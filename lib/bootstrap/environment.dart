enum Environment { dev, staging, prod }

class AppEnvironment {
  static late Environment env;

  static bool get isDev => env == Environment.dev;
  static bool get isProd => env == Environment.prod;
}
