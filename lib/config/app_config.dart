/// Build variant: https://medium0.com/@salvatoregiordanoo/flavoring-flutter-392aaa875f36

enum Flavor {
  staging,
  production,
}

class AppConfig {
  static Flavor flavor = Flavor.staging;
  const AppConfig();
  static String get baseGraphqlUrl {
    switch (flavor) {
      case Flavor.production:
        return 'http://54.251.1.59:30318/v1/graphql';
      case Flavor.staging:
        return 'http://54.251.1.59:30318/v1/graphql';
      default:
        return 'http://54.251.1.59:30318/v1/graphql';
    }
  }

  static String get baseRestfulUrl {
    switch (flavor) {
      case Flavor.production:
        return 'http://139.59.242.117/api/v1';
      case Flavor.staging:
        return 'http://188.166.180.70/api/v1';
      default:
        return 'http://139.59.242.117/api/v1';
    }
  }


  static String get baseS3Url {
    switch (flavor) {
      case Flavor.production:
        return 'http://prod.com/api/v1';
      case Flavor.staging:
        return 'http://staging.com/api/v1';
      default:
        return 'http://product.com/api/v1';
    }
  }

  static String get minVersion {
    switch (flavor) {
      case Flavor.production:
        return "production_min_version";
      case Flavor.staging:
      default:
        return "staging_min_version";
    }
  }

  static String get currentVersion {
    switch (flavor) {
      case Flavor.production:
        return "production_current_version";
      case Flavor.staging:
      default:
        return "staging_current_version";
    }
  }


  static String get hasuraSecret {
    switch (flavor) {
      case Flavor.production:
        return "2RLZgMyBn4yJpeti";
      case Flavor.staging:
      default:
        return "2RLZgMyBn4yJpeti";
    }
  }
}
