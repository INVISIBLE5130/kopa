import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'otp_screen.dart';

class PhoneVerification extends StatefulWidget {
  PhoneVerification({Key key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isValid = false;

  get state => null;

  Future<Null> validate(StateSetter updateState) async {
    if (_phoneNumberController.text.length == 10) {
      updateState(() {
        isValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1, 229, 229, 229),
      body: Container(
        padding: EdgeInsets.only(top: 100),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Stack(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/enter.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, top: 30),
                      child: Text("Enter",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _phoneNumberController,
                autofocus: true,
                onChanged: (text) {
                  validate(state);
                },
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
//                  prefix: Container(
//                    padding: EdgeInsets.all(4.0),
//                    child: Text(
//                      "+38",
//                      style: TextStyle(
//                          color: Colors.white,
//                      ),
//                    ),
//                  ),
//                  autovalidate: true,
//                  autocorrect: false,
//                  maxLengthEnforced: true,
//                  validator: (value) {
//                    return !isValid
//                        ? 'Please provide a valid 10 digit phone number'
//                        : null;
//                  },
                    hintText: '+38',
                    hintStyle: TextStyle(
                        color: Colors.white
                    )
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
