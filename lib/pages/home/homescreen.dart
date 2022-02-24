import 'package:currencyconverter/common/colors.dart';
import 'package:currencyconverter/common/components/currencyListing.dart';
import 'package:currencyconverter/common/helpers/appTourTargets.dart';
import 'package:currencyconverter/common/helpers/sizeManager.dart';
import 'package:currencyconverter/common/theme.dart';
import 'package:currencyconverter/common/ui/appBar.dart';
import 'package:currencyconverter/common/ui/bottomSheet.dart';
import 'package:currencyconverter/common/ui/buttons.dart';
import 'package:currencyconverter/common/ui/input.dart';
import 'package:currencyconverter/common/ui/wrapper.dart';
import 'package:currencyconverter/services/currency_service.dart';
import 'package:currencyconverter/services/states/states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  CurrencyService currencyService = CurrencyService();
  TextEditingController currency1 = TextEditingController();
  TextEditingController currency2 = TextEditingController();
  TextEditingController currencyOneAmount = TextEditingController();
  TextEditingController currencyTwoAmount = TextEditingController();
  final GlobalKey selectCurrencyOne = new GlobalKey();
  final GlobalKey selectCurrencyTwo = new GlobalKey();
  final GlobalKey amountKey = new GlobalKey();
  double rate = 0;
  AppTourTargets appTourTargets = AppTourTargets();

  initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getCurrency();
      currencyOneAmount.text = 0.toString();
      currencyTwoAmount.text = 0.toString();
      appTourTargets.addTargets(
          context: context,
          selectCurrencyOne: selectCurrencyOne,
          selectCurrencyTwo: selectCurrencyTwo,
          amountKey: amountKey);
    });
    super.initState();
  }

  Future getCurrency() async {
    await currencyService.getCurrencies();
  }

  Future startConversion() async {
    try {
      // get conversion rate using query
      var query = '${currency1.text}\_${currency2.text}';
      final result = await currencyService.getConversionRate(query);
      rate = result;

      setState(() {
        currencyTwoAmount.text =
            (int.tryParse(currencyOneAmount.text)!.toDouble() * rate)
                .toStringAsFixed(2)
                .toString();
      });
      print('rate $result');
    } catch (e) {
      Get.snackbar(
        "error fetching rate",
        "$e",
        icon: Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[900],
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  Widget build(BuildContext context) {
    SizeManager sizeManager = SizeManager(context);
    Controller c = Get.put(Controller());
    return Obx(() => Scaffold(
            body: CurrencyCalculatorWrapper(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Container(
                  width: sizeManager.scaledWidth(80),
                  child: RichText(
                    text: TextSpan(
                        text: 'Currency Calculator',
                        style: CurrencyCalculatorTheme.appNameStyle,
                        children: <TextSpan>[
                          TextSpan(
                            text: '.',
                            style: TextStyle(
                                color: CustomColors.green,
                                height: .5,
                                fontSize: 60),
                          )
                        ]),
                  ),
                ),
                SizedBox(height: 40),
                Input(
                    key: amountKey,
                    controller: currencyOneAmount,
                    validator: (String? value) {},
                    onSaved: (String? value) {},
                    borderColor: Colors.transparent,
                    keyboard: KeyboardType.NUMBER,
                    suffix: Text(
                      '${currency1.text}',
                      style: CurrencyCalculatorTheme.suffixText,
                    )),
                SizedBox(height: 20),
                Input(
                    controller: currencyTwoAmount,
                    readOnly: true,
                    enabled: false,
                    validator: (String? value) {},
                    onSaved: (String? value) {},
                    borderColor: Colors.transparent,
                    keyboard: KeyboardType.NUMBER,
                    suffix: Text(
                      '${currency2.text}',
                      style: CurrencyCalculatorTheme.suffixText,
                    )),
                SizedBox(height: 40),
                Row(
                  // key: selectCurrencyOne,
                  children: [
                    Container(
                      key: selectCurrencyOne,
                      child: Expanded(
                          // width: sizeManager.scaledWidth(35),
                          child: GestureDetector(
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                final result = await bottomSheetPopUp(
                                  ctx: context,
                                  child: Container(
                                    height: 300,
                                    child: CurrencyList(
                                        selectedCurrency: '${currency2.text}'),
                                  ),
                                );
                                setState(() {
                                  currency1.text = result ?? currency1.text;
                                  if (result != null)
                                    currencyTwoAmount.text = 0.toString();
                                });
                              },
                              child: Input(
                                  fillColor: Color(0xFFFFFFFF),
                                  controller: currency1,
                                  readOnly: true,
                                  enabled: false,
                                  validator: (String? value) {},
                                  onSaved: (String? value) {},
                                  borderColor: Color(0xFFD3D3D3),
                                  styleColor: Color(0xFF8F8F8F),
                                  suffix: Icon(Icons.arrow_drop_down)))),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.repeat_outlined,
                        size: 30, color: Color(0xFF8F8F8F)),
                    SizedBox(width: 10),
                    Container(
                        key: selectCurrencyTwo,
                        // key: selectCurrencyTwo,
                        child: Expanded(
                            // width: sizeManager.scaledWidth(35),
                            child: GestureDetector(
                          onTap: () async {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            final result = await bottomSheetPopUp(
                              ctx: context,
                              child: Container(
                                height: 300,
                                child: CurrencyList(
                                    selectedCurrency: '${currency1.text}'),
                              ),
                            );
                            setState(() {
                              currency2.text = result ?? currency2.text;
                              if (result != null)
                                currencyTwoAmount.text = 0.toString();
                            });
                          },
                          child: Input(
                              fillColor: Color(0xFFFFFFFF),
                              controller: currency2,
                              readOnly: true,
                              enabled: false,
                              styleColor: Color(0xFF8F8F8F),
                              validator: (String? value) {},
                              onSaved: (String? value) {},
                              borderColor: Color(0xFFD3D3D3),
                              suffix: Icon(Icons.arrow_drop_down)),
                        ))),
                  ],
                ),
                SizedBox(height: 40),
                SizedBox(
                    width: sizeManager.scaledWidth(100),
                    child: !c.isConverting.value
                        ? CustomButton(
                            disabled: currency1.text != '' &&
                                    currency1.text != '' &&
                                    int.tryParse(currencyOneAmount.text)! > 0
                                ? false
                                : true,
                            text: 'Convert',
                            onPressed: () {
                              startConversion();
                            },
                          )
                        : CustomLoadingButton())
              ],
            )))
          ],
        ))));
  }
}
