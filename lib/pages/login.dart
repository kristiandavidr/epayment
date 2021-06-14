import 'package:electronic_payment/pages/pin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

final _scaffoldKey = GlobalKey<ScaffoldState>();

final TextEditingController _phoneNumberController = TextEditingController();
final TextEditingController _smsController = TextEditingController();
String _verificationId;

PhoneVerificationCompleted verificationCompleted =
    (PhoneAuthCredential phoneAuthCredential) async {
  await _auth.signInWithCredential(phoneAuthCredential);
  showSnackbar(
      "Phone number automatically verified and user signed in: ${_auth.currentUser.uid}");
};

PhoneVerificationFailed verificationFailed =
    (FirebaseAuthException authException) {
  showSnackbar(
      'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
};
PhoneCodeSent codeSent =
    (String verificationId, [int forceResendingToken]) async {
  showSnackbar('Please check your phone for the verification code.');
  _verificationId = verificationId;
};

PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
    (String verificationId) {
  showSnackbar("verification code: " + verificationId);
  _verificationId = verificationId;
};

void verifyPhoneNumber() async {
  try {
    await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  } catch (e) {
    print("Phone Number bla bla");
  }
}

void signInWithPhoneNumber(context) async {
  try {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: _smsController.text,
    );

    final User user = (await _auth.signInWithCredential(credential)).user;

    showSnackbar("Successfully signed in UID: ${user.uid}");
  } catch (e) {
    print('uh oh');
  }
}

void showSnackbar(String message) {
  // ignore: deprecated_member_use
  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In or Sign Up With Phone Number',
                      style: GoogleFonts.quicksand(
                        fontSize: 22,
                      ),
                    ),
                    Divider(
                      height: 80,
                      color: Colors.black,
                    ),
                    Text('Enter Your Phone number',
                        style: GoogleFonts.quicksand(fontSize: 20)),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _phoneNumberController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: '+62 123455678',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                      ),
                      style: TextStyle(),
                    ),
                    TextFormField(
                      controller: _smsController,
                      decoration:
                          const InputDecoration(labelText: 'Verification code'),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        child: Text("Verify Number"),
                        onPressed: () async {
                          verifyPhoneNumber();
                        },
                      ),
                    ),
                  ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.infinity,
                  height: 213,
                  color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.all(29.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "By Tapping Sign Up \n you agree with our terms of service ",
                            style: GoogleFonts.quicksand(fontSize: 20)),
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                            width: 351,
                            height: 51,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PinPutTest();
                              }));
                            },
                            child: Text(
                              'Sign In or Sign Up',
                              style: GoogleFonts.quicksand(
                                  color: Colors.black, fontSize: 25),
                            ),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
