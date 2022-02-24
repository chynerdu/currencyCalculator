import 'package:currencyconverter/Models/currencyModel.dart';
import 'package:currencyconverter/services/api_path.dart';
import 'package:currencyconverter/services/http_instance.dart';
import 'package:currencyconverter/services/states/states.dart';
import 'package:get/get.dart';

class CurrencyService {
  final _service = HttpInstance.instance;

  Future getCurrencies() async {
    Controller c = Get.put(Controller());
    try {
      c.updateLoadingState(true);
      final result = await _service.getData(path: APIPath.currencies());
      // change object returned from api to List of Map
      List currencyList = result['results']
          .entries
          .map((entry) => CurrencyModel.fromJson(entry.value))
          .toList();

      List<CurrencyModel> newList = [...currencyList];
      // update state
      c.updateCurrencyState(newList);
      c.updateLoadingState(false);
      print('currency List $newList');
    } catch (e) {
      print('err $e');
      c.updateLoadingState(true);
      throw e;
    }
  }

  Future getConversionRate(query) async {
    Controller c = Get.put(Controller());
    try {
      c.updateConvertingState(true);
      final result = await _service.getData(path: APIPath.converter(query));
      c.updateConvertingState(false);
      return result['$query'];
    } catch (e) {
      c.updateConvertingState(false);
      print('err $e');
      throw e;
    }
  }
}
