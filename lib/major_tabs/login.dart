import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ksb_app/constants/input_decor.dart';
import 'package:ksb_app/constants/string_res.dart';
import 'package:ksb_app/notifiers/login_notifier.dart';
import 'package:ksb_app/routes/routes.dart';
import 'package:ksb_app/utils/utils.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  late TextEditingController jobIdController;
  bool _passwordVisible = false;
  var myEmail = "";
  var myPassword = "";
  var myJobId = "";

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    passwordController.dispose();
    emailAddressController.dispose();
    jobIdController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    emailAddressController = TextEditingController();
    jobIdController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldStateKey,
        body: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 350,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailAddressController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: inputDecor.copyWith(
                              labelText: 'Email Address',
                            ),
                            onSaved: (email) {
                              myEmail = email!;
                            },
                            validator: (email) {
                              if (email != null) {
                                if (email.isNotEmpty) {
                                  return null;
                                }
                              }
                              return mandatoryWarning;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: jobIdController,
                            decoration: inputDecor.copyWith(
                              labelText: 'Employment ID',
                            ),
                            onSaved: (id) {
                              myJobId = id!;
                            },
                            validator: (id) {
                              if (id != null) {
                                if (id.isNotEmpty) {
                                  return null;
                                }
                              }
                              return mandatoryWarning;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: !_passwordVisible,
                            decoration: inputDecor.copyWith(
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  !_passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            onSaved: (password) {
                              myPassword = password!;
                            },
                            validator: (password) {
                              if (password != null) {
                                if (password.isNotEmpty) {
                                  return null;
                                }
                              }
                              return mandatoryWarning;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        FormState? formState = _formKey.currentState;
                        if (formState?.validate() ?? false) {
                          formState?.save();
                          Map<String, dynamic> logDetails = {
                            "emailAddress": myEmail,
                            "password": myPassword,
                            "jobId": myJobId,
                          };
                          //TODO: send above map and handle login response

                          int code = 200;
                          bool isSuccessful = code == 200;

                          if (isSuccessful) {
                            context.read<LoginNotifier>().setEmail(myEmail);
                            context.read<LoginNotifier>().setJobId(myJobId);
                            context
                                .read<LoginNotifier>()
                                .setPassword(myPassword);
                            // createSnackBar(
                            //     context:
                            //         _scaffoldStateKey.currentState!.context,
                            //     text: 'Successful');
                          } else {
                            createSnackBar(
                                context:
                                    _scaffoldStateKey.currentState!.context,
                                text: 'Unsuccessful');
                          }
                          bool isEng = true;
                          if (isEng) {
                            Navigator.of(context)
                                .popAndPushNamed(RouteManager.home);
                          }
                        }
                      },
                      child: Text("LOGIN"),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.brown,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: "Register",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.brown,
                              fontWeight: FontWeight.normal,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                Navigator.of(context)
                                    .popAndPushNamed(RouteManager.signUp);
                              },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
