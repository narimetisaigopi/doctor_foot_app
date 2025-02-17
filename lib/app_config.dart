import 'utils/enums.dart';

class AppConfig {
  Flavor flavor = Flavor.user;

  static AppConfig shared = AppConfig.create();

  factory AppConfig.create({
    Flavor flavor = Flavor.user,
  }) {
    return shared = AppConfig(flavor);
  }

  AppConfig(this.flavor);
}
