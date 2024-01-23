
class AppConstants {
  AppConstants._();

  static const String baseUrl= "https://api.weatherapi.com";
  static const String keyToken= "e76d154ceb2a4e05a2c62513241901";

  static const double demoLatitude = 41.304223;
  static const double demoLongitude = 69.2348277;
  static const double pinLoadingMin = 0.116666667;
  static const double pinLoadingMax = 0.611111111;

  ///refresh duration
  static const Duration timeRefresh = Duration(seconds: 30);

  /// shared preferences keys
  static const String keyCountry = 'keyCountry';
}
