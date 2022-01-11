import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String seelcterCurr = 'USD';

  DropdownButton<String> AndroidDropDown() {
    List<DropdownMenuItem<String>> list = [];

    for (String Currency in currenciesList) {
      var dropdown = DropdownMenuItem<String>(
        child: Text(Currency),
        value: Currency,
      );
      list.add(dropdown);
    }

    return DropdownButton<String>(
      value: seelcterCurr,
      items: list,
      onChanged: (value) {
        setState(() {
          seelcterCurr = value!;
        });
      },
    );
  }

  CupertinoPicker ioswidget() {
    List<Widget> items = [];
    for (String Curr in currenciesList) {
      var newItem = Text(Curr);
      items.add(newItem);
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(onPressed: () {}, child: Text('1 BTC= ? USD')),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue.shade400,
            child: Platform.isIOS ? ioswidget() : AndroidDropDown(),
          ),
        ],
      ),
    );
  }
}
