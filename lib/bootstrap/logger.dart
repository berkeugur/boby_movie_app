import 'package:logger/logger.dart';
import 'environment.dart';

class LoggerConfig {
  static late final Logger logger;

  static void setup() {
    if (AppEnvironment.isDev) {
      logger = Logger(
        level: Level.debug,
        printer: PrettyPrinter(methodCount: 2, errorMethodCount: 5, lineLength: 100, colors: true, printEmojis: true),
      );
    } else {
      logger = Logger(level: Level.warning, printer: SimplePrinter());
    }
  }
}
