import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

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

class Dashboard extends StatelessWidget {
  Dashboard({Key key}) : super(key: key);

  List<Investment> trial = [
    Investment('Tesla', 100),
    Investment('Apple', 150),
    Investment('WallMart', 400)
  ];

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
          itemCount: trial.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                hoverColor: Color.fromARGB(133, 75, 28, 155),
                onTap: () {},
                title: Text(trial[index].invName),
                trailing: Text(
                  '500',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          },
        ),
      )
    ]));
  }
}
