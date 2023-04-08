import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:register/second.dart';

class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  String url = "";
  String name = "";
  String email = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Web',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'Fun',
              style: TextStyle(
                color: Colors.yellow[700],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Login with Google"),
          onPressed: () {
            _googleSignIn.signIn().then((userData) {
              setState(() {
                _userObj = userData;
                url = _userObj!.photoUrl.toString();
                name = _userObj!.displayName.toString();
                email = _userObj!.email;
              });
              if (userData != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (second(
                      url: url,
                      name: name,
                      email: email,
                    )),
                  ),
                );
              }
            }).catchError((e) {
              print(e);
            });
          },
        ),
      ),
    );
  }
}
