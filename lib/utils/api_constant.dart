class ApiConstants {
  static const scheme = 'https';
  static const baseUrl = 'superheroapi.com';
  static const token = '1900121036863469';
  static const superHeroId = 644;
  static get getEvents =>
      ////////////////////
      Uri(host: baseUrl, scheme: scheme, path: '/api/$token/$superHeroId');
}
