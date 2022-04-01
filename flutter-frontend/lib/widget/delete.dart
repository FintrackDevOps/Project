import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mipx/widget/connect.dart';
import 'package:mipx/widget/connect2.dart';
import 'dart:convert';
import 'connect4.dart';

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

class Delete extends StatefulWidget {
  Delete({Key key}) : super(key: key);
  @override
  _Delete createState() => _Delete();
}

class _Delete extends State<Delete> {
  List<Invest> invList = [];

  void lumber() async {
    Client.getEm().then((response) => {
          setState(() {
            Iterable lijst = json.decode(response.body);
            invList = lijst.map((model) => Invest.fromJson(model)).toList();
          })
        });
  }

  @override
  void initState() {
    super.initState();
    lumber();
  }

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
        child: ListView.builder(
          itemCount: invList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                hoverColor: Color.fromARGB(133, 75, 28, 155),
                onTap: () {},
                title: Text(invList[index].description),
                trailing: TextButton(
                  onPressed: () => ClientDel.getDelete(index.toString()),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
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
                      'Delete',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )
      //]),
    ]));
  }
}
