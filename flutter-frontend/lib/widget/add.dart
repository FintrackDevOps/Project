import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mipx/widget/connect.dart';
import 'package:flutter/services.dart';

import 'connect3.dart';

class Investment {
  String invName;
  int buyPrice;
  int currentPrice;
  int dif;

  Investment(String invName, int buyPrice) {
    this.invName = invName;
    this.buyPrice = buyPrice;
  }
}

class Add extends StatefulWidget {
  Add({Key key}) : super(key: key);

  @override
  _Add createState() => _Add();
}

class _Add extends State<Add> {
  bool _add = false;

  final descriptionF = TextEditingController();
  final buyvalueF = TextEditingController();
  final amountF = TextEditingController();
  final stockabreviation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 16),
          ],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
                child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Center(
                        child: Text(
                      'Portfolio',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ))),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ))),
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/add'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )),
            Container(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ))),
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/delete'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )),
            Container(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ))),
                  onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )),
            SizedBox(
              width: 60,
            ),
          ],
        ),
      ),

      // Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: <Widget>[
      //     GestureDetector(
      //       onTap: () {},
      //       child: Text(
      //         'Portfolio',
      //         style: TextStyle(fontSize: 18),
      //       ),
      //     ),
      //     GestureDetector(
      //       onTap: () {},
      //       child: Text(
      //         'Account',
      //         style: TextStyle(fontSize: 18),
      //       ),
      //     ),
      //     SizedBox(
      //       width: 60,
      //     ),
      //   ],
      // )
      //],
      //),
      //),
      // Column(children: [
      //   Container(
      //     height: 200,
      //     padding: EdgeInsets.only(left: 250, top: 250),
      //     child: Text(
      //       'Portfolio\'s',
      //       style: TextStyle(fontSize: 110, fontWeight: FontWeight.bold),
      //     ),
      //   ),
      Expanded(
          child: Padding(
        padding: EdgeInsets.only(top: 25, left: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add investment',
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12, top: 40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 200,
                            child: Text('Investment name:',
                                style: TextStyle(fontSize: 18))),
                        Container(
                          width: 400,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '\'tesla\'',
                              errorText: _add ? 'Put in a value' : null,
                            ),
                            controller: descriptionF,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            width: 200,
                            child: Text('Buying price (in euro\'s):',
                                style: TextStyle(fontSize: 18))),
                        Container(
                          width: 400,
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              hintText: '\'200\'',
                              errorText: _add ? 'Put in a value' : null,
                            ),
                            controller: buyvalueF,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            width: 200,
                            child: Text('current price (in euro\'s):',
                                style: TextStyle(fontSize: 18))),
                        Container(
                          width: 400,
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              hintText: '\'200\'',
                              errorText: _add ? 'Put in a value' : null,
                            ),
                            controller: amountF,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      // onPressed: () => makeInvest(Invest(buyvalueF.text,
                      //     int.parse(amountF.text), descriptionF.text, "long")),

                      onPressed: () {
                        amountF.text.isEmpty &&
                                buyvalueF.text.isEmpty &&
                                descriptionF.text.isEmpty
                            ? makeInvest(Invest(
                                buyvalueF.text,
                                int.parse(amountF.text),
                                descriptionF.text,
                                'kjvb'))
                            : null;
                        setState(() {
                          amountF.text.isEmpty &&
                                  buyvalueF.text.isEmpty &&
                                  descriptionF.text.isEmpty
                              ? _add = true
                              : _add = false;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[200],
                              spreadRadius: 10,
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: Text(
                          'Add',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ))
      //]),
    ]));
  }
}
