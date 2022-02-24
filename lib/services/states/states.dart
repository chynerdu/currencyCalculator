import 'package:currencyconverter/Models/currencyModel.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  // define loading state.
  final isLoading = false.obs;
  final isConverting = false.obs;
  final currencyList = <CurrencyModel>[].obs;

  void updateCurrencyState(state) => currencyList.value = state;
  void updateLoadingState(state) => isLoading.value = state;
  void updateConvertingState(state) => isConverting.value = state;
}
