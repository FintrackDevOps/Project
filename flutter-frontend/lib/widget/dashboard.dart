import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mipx/widget/connect.dart';
import 'package:mipx/widget/connect2.dart';
import 'dart:convert';

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

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _Dashboard createState() => _Dashboard();
}

// List<Investment> trial = [
//   Investment('Tesla', 100),
//   Investment('Apple', 150),
//   Investment('WallMart', 400)
// ],

class _Dashboard extends State<Dashboard> {
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
      Expanded(
        child: ListView.builder(
          // Change back to length!!
          itemCount: invList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                  hoverColor: Color.fromARGB(133, 75, 28, 155),
                  onTap: () {},
                  // title: Text(trial[index].invName),
                  title: Text(invList[index].description),
                  trailing: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Your buy value was: ',
                        ),
                        TextSpan(
                            text: invList[index].buyvalue,
                            style: TextStyle(color: Colors.green)),
                        TextSpan(
                          text: ' the current value is: ',
                        ),
                        TextSpan(
                            text: invList[index].amount.toString(),
                            style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  )),
            );
          },
        ),
      )
    ]));
  }
}
