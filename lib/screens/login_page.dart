import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                Text(
                  'Learn Free',
                  style: TextStyle(
                    fontSize: 23.0,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'We make learning easy. Join our coding bootcamp for free and also don\'t forget to follow us on social media.',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Image.asset(
              'assets/images/splash_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 28,
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(
                  0xFFB40284A,
                ),
                borderRadius: BorderRadius.circular(
                  50,
                ),
              ),
              child: Text(
                'Get Started',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.75,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
