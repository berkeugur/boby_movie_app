class FlavorConfig {
  final String baseUrl;
  final String flavorName;

  static late FlavorConfig _instance;

  FlavorConfig._(this.baseUrl, this.flavorName);

  static void init({required String baseUrl, required String flavorName}) {
    _instance = FlavorConfig._(baseUrl, flavorName);
  }

  static FlavorConfig get instance => _instance;
}
