import 'package:currencyconverter/Models/currencyModel.dart';
import 'package:currencyconverter/common/colors.dart';
import 'package:currencyconverter/services/states/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyList extends StatelessWidget {
  final String selectedCurrency;
  CurrencyList({required this.selectedCurrency});
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    return Obx(() => Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.green,
          automaticallyImplyLeading: false,
          title: Text('Change currency'),
          actions: [
            GestureDetector(
                onTap: () => Navigator.pop(context), child: Icon(Icons.close)),
            SizedBox(width: 20),
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
                itemCount: c.currencyList.length,
                itemBuilder: (context, index) {
                  CurrencyModel currency = c.currencyList[index];
                  return ListTile(
                    enabled: selectedCurrency == currency.id ? false : true,
                    onTap: () {
                      Navigator.pop(context, '${currency.id}');
                    },
                    title: Text('${currency.currencyName}'),
                    trailing: Text('${currency.currencySymbol}'),
                  );
                }))));
  }
}
