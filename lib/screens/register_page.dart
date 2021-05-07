import 'package:ewallet/widget/contans.dart';
import 'package:ewallet/widget/custom_btn.dart';
import 'package:ewallet/widget/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Future<void> _alterDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close Dialog"))
            ],
          );
        });
  }

  //Create a new user
  Future<String> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provieded is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    setState(() {
      _registerFormLoading = true;
    });

    //run a create method
    String _createAccountFeedback = await _createAccount();

    if (_createAccountFeedback != null) {
      _alterDialogBuilder(_createAccountFeedback);

      setState(() {
        _registerFormLoading = false;
      });
    }
    else {
       Navigator.pop(context);
    }
  }

  bool _registerFormLoading = false;
  FocusNode _passwordFocusNode;
  String _registerEmail = "";
  String _registerPassword = "";

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 16.0,
                ),
                child: Text(
                  "Create your account",
                  textAlign: TextAlign.center,
                  style: Constants.boldHeading,
                ),
              ),
              Column(
                children: [
                  CustomInput(
                    onChange: (value) {
                      _registerEmail = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    hintText: "Emailllllllllllllll...............",
                    textInputAction: TextInputAction.next,
                  ),
                  CustomInput(
                    isPasswordField: true,
                    onChange: (value) {
                      _registerPassword = value;
                    },
                    focusNode: _passwordFocusNode,

                    onSubmitted: (value) {
                      _submitForm();
                    },
                    hintText: "Passwordddddddddddd...............",
                  ),
                  CustomBtn(
                    text:"Create" ,
                    onPressed: (){
                      _submitForm();
                    },
                    isLoading: _registerFormLoading,
                  ),
                ],
              ),
              CustomBtn(
                text: "Back to login",
                onPressed: (){
                  Navigator.pop(context);
                },
                outlineBtn: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
