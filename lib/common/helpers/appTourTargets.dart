import 'package:currencyconverter/common/colors.dart';
import 'package:currencyconverter/services/localStorage.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class AppTourTargets {
  List<TargetFocus> targets = [];
  LocalStorage localStorage = LocalStorage();

  void addTargets({
    context,
    selectCurrencyOne,
    selectCurrencyTwo,
    amountKey,
  }) {
    targets.add(TargetFocus(
        identify: "selectCurrencyOne",
        keyTarget: selectCurrencyOne,
        contents: [
          TargetContent(
              // align: ContentAlign.left,
              child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Select Base Currency",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Tap to select currency to convert from",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ))
        ]));

    targets.add(
        TargetFocus(identify: "selectCurrencyTwo", keyTarget: selectCurrencyTwo,
            //  color: Colors.red,
            contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(height: MediaQuery.of(context).size.height * 0.17),
                    Text(
                      "Select Currency two",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Tap to select currency to convert to ",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ))
        ]));

    targets.add(TargetFocus(identify: "amountKey", keyTarget: amountKey,
        //  color: Colors.red,
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                    Text(
                      "Enter amount",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Enter the amoiunt you want to calculate ",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ))
        ]));

    showTutorial(context);
  }

  void showTutorial(context) async {
    try {
      // call appTour when user has not completed tour.
      if (await localStorage.getBoolData(name: 'completedTour') != true) {
        TutorialCoachMark(
          context,
          targets: targets, // List<TargetFocus>
          colorShadow: CustomColors.greenDark, // DEFAULT Colors.black

          onClickTarget: (target) {
            print(target);
          },
          onClickOverlay: (target) {
            print(target);
          },
          onSkip: () async {
            print("skip");
            await localStorage.setBoolData(name: "completedTour", data: true);
          },
          onFinish: () async {
            print("finish");
            await localStorage.setBoolData(name: "completedTour", data: true);
          },
        )..show();
        return;
      }
    } catch (e) {
      print('error $e');
      await localStorage.setBoolData(name: "completedTour", data: true);
    }
  }
}
