import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _fontColor = Colors.black;

  double _marginTop = 100;

  double _loginWidth = 0;
  double _loginHeight = 0;

  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;

  double _registerHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  KeyboardVisibilityNotification _keyboardVisibility =
      new KeyboardVisibilityNotification();
  int _keyboardVisibilitySubscriberId;
  bool _keyboardState;

  @protected
  void initState() {
    super.initState();

    _keyboardState = _keyboardVisibility.isKeyboardVisible;

    _keyboardVisibilitySubscriberId = _keyboardVisibility.addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardState = visible;
        });
      },
    );
  }

  @override
  void dispose() {
    _keyboardVisibility.removeListener(_keyboardVisibilitySubscriberId);
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;
    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _fontColor = Colors.black;
        _marginTop = 100;
        _loginOpacity = 1;

        _loginWidth = windowWidth;
        _loginYOffset = windowHeight;
        _loginHeight = _keyboardState ? windowHeight : windowHeight - 270;
        _loginXOffset = 0;
        _registerYOffset = windowHeight;

        break;
      case 1:
        _backgroundColor = Color(0xFF00B0FF);
        _fontColor = Colors.white;
        _loginWidth = windowWidth;
        _marginTop = 95;
        _loginOpacity = 1;

        _loginYOffset = _keyboardState ? 40 : 270;
        _loginHeight = _keyboardState ? windowHeight : windowHeight - 270;
        _loginXOffset = 0;
        _registerYOffset = windowHeight;

        break;
      case 2:
        _backgroundColor = Color(0xFF00B0FF);
        _fontColor = Colors.white;
        _marginTop = 90;
        _loginOpacity = 0.3;
        _loginWidth = windowWidth - 40;

        _loginYOffset = 240;
        _loginHeight = _keyboardState ? windowHeight : windowHeight - 240;
        _loginXOffset = 20;
        _registerYOffset = _keyboardState ? 50 : 270;
        _registerHeight = _keyboardState ? windowHeight : windowHeight - 270;

        break;
    }
    //https://assets1.lottiefiles.com/packages/lf20_rycdh53q.json

    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(
            milliseconds: 500,
          ),
          curve: Curves.easeIn,
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pageState = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeIn,
                        margin: EdgeInsets.only(
                          top: _marginTop,
                        ),
                        child: Text(
                          'Learn Free',
                          style: TextStyle(
                            fontSize: 25.0,
                            letterSpacing: 1.25,
                            color: _fontColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AnimatedContainer(
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeIn,
                        child: Text(
                          'Join our coding bootcamp and get opportunity to work as a software developer in top IT companies.',
                          style: TextStyle(
                            fontSize: 18,
                            color: _fontColor,
                            letterSpacing: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
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
                    margin: EdgeInsets.only(
                      bottom: 30,
                    ),
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
        ),
        AnimatedContainer(
          width: _loginWidth,
          height: _loginHeight,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: Colors.white.withOpacity(
              _loginOpacity,
            ),
          ),
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Text('Login to Continue'),
                    SizedBox(
                      height: 15,
                    ),
                    InputContainer(
                      text: 'Email',
                      icon: Icons.email,
                    ),
                    InputContainer(
                      text: 'Password',
                      icon: Icons.vpn_key,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    PrimaryButton(
                      buttonText: 'Get Started',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 2;
                        });
                      },
                      child: OutlineButton(
                        buttonText: 'Create Account',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        AnimatedContainer(
          height: _registerHeight,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Text('Create a new account'),
                    SizedBox(
                      height: 15,
                    ),
                    InputContainer(
                      text: 'Email',
                      icon: Icons.email,
                    ),
                    InputContainer(
                      text: 'Password',
                      icon: Icons.vpn_key,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    PrimaryButton(
                      buttonText: 'Signup',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            _pageState = 1;
                          },
                        );
                      },
                      child: OutlineButton(
                        buttonText: 'Already have an account?',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class InputContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  InputContainer({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Icon(
                icon,
                color: Colors.grey,
              )),
          Expanded(
              flex: 9,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String buttonText;
  PrimaryButton({this.buttonText});
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF00B0FF),
        borderRadius: BorderRadius.circular(
          50,
        ),
      ),
      child: Center(
        child: Text(
          widget.buttonText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class OutlineButton extends StatefulWidget {
  final String buttonText;
  OutlineButton({this.buttonText});
  @override
  _OutlineButtonState createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<OutlineButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Color(0xFF00B0FF),
        ),
        borderRadius: BorderRadius.circular(
          50,
        ),
      ),
      child: Center(
        child: Text(
          widget.buttonText,
          style: TextStyle(
            color: Color(0xFF00B0FF),
          ),
        ),
      ),
    );
  }
}
