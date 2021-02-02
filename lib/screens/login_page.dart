import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _fontColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        // _fontColor = Colors.black;
        break;
      case 1:
        _backgroundColor = Color(0xFFB2EBF2);
        // _fontColor = Colors.white;
        break;
      case 2:
        _backgroundColor = Colors.white;
        // _fontColor = Colors.black;
        break;
    }
    //https://assets1.lottiefiles.com/packages/lf20_rycdh53q.json
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 500,
      ),
      color: _backgroundColor,
      padding: EdgeInsets.only(top: 100, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Text(
                  'Learn Free',
                  style: TextStyle(
                    fontSize: 25.0,
                    letterSpacing: 1.25,
                    color: _fontColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Join our coding bootcamp and get opportunity to work as a software developer in top IT companies.',
                  style: TextStyle(
                    fontSize: 18,
                    color: _fontColor,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Lottie.asset('assets/images/learning.json'),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 28,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _pageState = (_pageState == 1) ? 0 : 1;
                });
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Color(
                    0xFF00B0FF,
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
          ),
        ],
      ),
    );
  }
}
