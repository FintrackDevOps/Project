import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final userName = TextEditingController();
  final passWord = TextEditingController();
  final passWord2 = TextEditingController();

  Register({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                spreadRadius: 15,
                blurRadius: 10,
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 50),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 300,
                                child: Text('Username:',
                                    style: TextStyle(fontSize: 18))),
                            Container(
                              width: 400,
                              child: TextField(
                                controller: userName,
                                decoration:
                                    InputDecoration(hintText: 'username'),
                                //controller: company,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                width: 300,
                                child: Text('Password',
                                    style: TextStyle(fontSize: 18))),
                            Container(
                              width: 400,
                              child: TextField(
                                controller: passWord,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration:
                                    InputDecoration(hintText: 'password'),
                                //controller: buyVar,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                width: 300,
                                child: Text('Repeat password',
                                    style: TextStyle(fontSize: 18))),
                            Container(
                              width: 400,
                              child: TextField(
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                controller: passWord2,
                                decoration:
                                    InputDecoration(hintText: 'password'),
                                //controller: buyVar,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 400),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 25),
                                  child: TextButton(
                                    onPressed: () => AlertDialog(
                                        //content: Text(company.text),
                                        ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 8),
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
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 25),
                                  child: TextButton(
                                    onPressed: () =>
                                        Navigator.pushReplacementNamed(
                                            context, '/'),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 8),
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
                                        'Back',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
