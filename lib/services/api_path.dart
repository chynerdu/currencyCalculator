import 'package:currencyconverter/services/config.dart';

class APIPath {
  static String converter(query) =>
      '${Config.baseUrl}/api/v7/convert?q=$query&compact=ultra&apiKey=${Config.apiKey}';

  // static String converter(from, to, amount) =>
  //     '${Config.fixerBaseUrl}/convert?access_key=${Config.apiKey}&from=$from&to=$to&amount=&amount';

  static String currencies() =>
      '${Config.baseUrl}/api/v7/currencies?apiKey=${Config.apiKey}';
}
