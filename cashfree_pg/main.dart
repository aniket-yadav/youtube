import 'dart:convert';
import 'dart:math';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          child: Text(
            "CashFree Payment gateway integration",
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //  amount input field
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 20,
            ),
            child: TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.currency_rupee),
                hintText: "Enter amount",
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          //  pay button
          ElevatedButton(
            child: const Text("Pay"),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              final amount = _amountController.text.trim();
              if (amount.isEmpty) {
                 ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Enter amount"),
                  ),
                );
                return;
              }

              num orderId = Random().nextInt(1000) ;

              num payableAmount = num.parse(amount);
              getAccessToken(payableAmount,orderId).then((tokenData) {
                Map<String, String> _params = {
                  'stage': 'TEST',
                  'orderAmount': amount,
                  'orderId': '$orderId',
                  'orderCurrency': 'INR',
                  'customerName': '<Customer Name>',
                  'customerPhone': '<Customer Phone>',
                  'customerEmail': '<Customer Email>',
                  'tokenData': tokenData,
                  'appId': '<App Id>',
                };
                CashfreePGSDK.doPayment(_params).then((value) {
                  print(value);
                  if (value != null) {
                    if (value['txStatus'] == 'SUCCESS') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Payment Success"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Payment Failed"),
                        ),
                      );
                    }
                  }
                });
              });
            },
          ),
        ],
      ),
    );
  }

//  
  Future<String> getAccessToken(num amount,num orderId) async {
    var res = await http.post(
      Uri.https("test.cashfree.com", "api/v2/cftoken/order"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'x-client-id': "<App Id>",
        'x-client-secret': "<App Secret>",
      },
      body: jsonEncode(
        {
          "orderId": '$orderId',
          "orderAmount": amount,
          "orderCurrency": "INR",
        },
      ),
    );
    if (res.statusCode == 200) {
      var jsonResponse = jsonDecode(res.body);
      if (jsonResponse['status'] == 'OK') {
        return jsonResponse['cftoken'];
      }
    }
    return '';
  }
}
