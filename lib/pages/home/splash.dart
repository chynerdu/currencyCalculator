import 'package:currencyconverter/common/colors.dart';
import 'package:currencyconverter/common/helpers/sizeManager.dart';
import 'package:currencyconverter/common/theme.dart';
import 'package:currencyconverter/pages/home/homescreen.dart';
import 'package:currencyconverter/services/currency_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool hasError = false;
  CurrencyService currencyService = CurrencyService();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();

    getCurrency();
    super.initState();
  }

  Future getCurrency() async {
    await currencyService.getCurrencies();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    SizeManager sizeManager = SizeManager(context);
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          child: Container(
            child: !hasError
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Container(
                              // width: sizeManager.scaledWidth(100),
                              child: Text('Currency Calculator',
                                  style: CurrencyCalculatorTheme.appNameStyle
                                      .copyWith(fontSize: 20)))),
                      SizedBox(height: 40),
                      SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            color: CustomColors.PrimaryColor,
                          ))
                    ],
                  )
                : InitError(onPressed: getCurrency),
          ),
        ),
      ),
    );
  }
}

class InitError extends StatelessWidget {
  final Function onPressed;
  InitError({required this.onPressed});
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Something is not right!", style: TextStyle(fontSize: 18)),
        SizedBox(height: 5),
        Text("Its seems we can't fetch currency",
            style: TextStyle(fontSize: 18)),
        SizedBox(height: 5),
        TextButton(
            onPressed: () => onPressed(),
            child: Text('Retry',
                style:
                    TextStyle(fontSize: 16, color: CustomColors.PrimaryColor)))
      ],
    ));
  }
}
