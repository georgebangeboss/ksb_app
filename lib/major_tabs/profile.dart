import 'package:flutter/material.dart';
import 'package:ksb_app/constants/input_decor.dart';
import 'package:ksb_app/constants/string_res.dart';
import 'package:ksb_app/routes/routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _firstName,
      _surname,
      _email,
      _phoneNumber,
      _regNo,
      _password,
      _passwordConfirm,
      _role;
  late TextEditingController surnameController;
  late TextEditingController firstNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController regNoController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;

  bool _passwordVisible = false;
  bool _passwordConfirmVisible = false;
  bool _isError = false;
  String? _errorMessage;
  final errorMessages = <String, String>{
    "takenEmail": "The email you have entered is taken, contact admin!",
    "takenID": "The employee ID you have entered taken, contact admin!",
    "passMismatch": "Passwords did not match!",
    "departmentEmpty": "Select your Department!"
  };

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    regNoController = TextEditingController();
    phoneNumberController = TextEditingController();
    firstNameController = TextEditingController();
    surnameController = TextEditingController();
    passwordConfirmController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile"),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 8, right: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 8),
                              child: TextFormField(
                                controller: firstNameController,
                                keyboardType: TextInputType.text,
                                decoration: inputDecor.copyWith(
                                  labelText: 'First Name',
                                ),
                                onSaved: (firstName) {
                                  _firstName = firstName!;
                                },
                                validator: (firstName) {
                                  if (firstName != null) {
                                    if (firstName.isNotEmpty) {
                                      return null;
                                    }
                                  }
                                  return mandatoryWarning;
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: surnameController,
                              keyboardType: TextInputType.text,
                              decoration: inputDecor.copyWith(
                                labelText: 'Last Name',
                              ),
                              onSaved: (surname) {
                                _surname = surname!;
                              },
                              validator: (surname) {
                                if (surname != null) {
                                  if (surname.isNotEmpty) {
                                    return null;
                                  }
                                }
                                return mandatoryWarning;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: inputDecor.copyWith(
                          labelText: 'Email Address',
                        ),
                        onSaved: (email) {
                          _email = email!;
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
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: inputDecor.copyWith(
                          labelText: 'Phone Number',
                        ),
                        onSaved: (phoneNumber) {
                          _phoneNumber = phoneNumber!;
                        },
                        validator: (phoneNumber) {
                          if (phoneNumber != null) {
                            if (phoneNumber.isNotEmpty) {
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
                        controller: regNoController,
                        keyboardType: TextInputType.number,
                        decoration: inputDecor.copyWith(
                          labelText: 'Employee ID',
                        ),
                        onSaved: (regNo) {
                          _regNo = regNo!;
                        },
                        validator: (regNo) {
                          if (regNo != null) {
                            if (regNo.isNotEmpty) {
                              return null;
                            }
                          }
                          return mandatoryWarning;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      DropdownButtonFormField(
                        decoration: inputDecor,
                        items: specialties
                            .map(
                              (specialty) => DropdownMenuItem(
                                child: Text(
                                  specialty,
                                ),
                                value: specialty,
                              ),
                            )
                            .toList(),
                        onChanged: (String? role) {
                          if (role != null) {
                            setState(() => _role = role);
                          }
                        },
                        value: _role ?? selectRoleTxt,
                        validator: (String? value) {
                          if (value! == selectRoleTxt) {
                            setState(() {
                              _isError = true;
                              _errorMessage = errorMessages["departmentEmpty"];
                            });
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: !_passwordVisible,
                        decoration: inputDecor.copyWith(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
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
                          _password = password!;
                        },
                        onChanged: (password) {
                          _password = password;
                        },
                        validator: (password) {
                          if (password != null) {
                            if (password.isNotEmpty) {
                              if (password == _passwordConfirm) {
                                return null;
                              } else {
                                setState(() {
                                  _isError = true;
                                  _errorMessage = errorMessages["passMismatch"];
                                });

                                return null;
                              }
                            }
                          }
                          return mandatoryWarning;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: passwordConfirmController,
                        obscureText: !_passwordConfirmVisible,
                        decoration: inputDecor.copyWith(
                          labelText: 'Password Confirm',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordConfirmVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordConfirmVisible =
                                    !_passwordConfirmVisible;
                              });
                            },
                          ),
                        ),
                        onChanged: (passwordConfirm) {
                          _passwordConfirm = passwordConfirm;
                        },
                        validator: (passwordConfirm) {
                          if (passwordConfirm != null) {
                            if (passwordConfirm.isNotEmpty) {
                              if (passwordConfirm == _password) {
                                return null;
                              } else {
                                setState(() {
                                  _isError = true;
                                  _errorMessage = errorMessages["passMismatch"];
                                });

                                return null;
                              }
                            }
                          }
                          return mandatoryWarning;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                if (_isError)
                  Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            _errorMessage!,
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style: genTxt.copyWith(
                                color: Color.fromARGB(255, 1, 25, 44)),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 228, 34, 20),
                        ),
                        padding: EdgeInsets.all(3),
                        width: double.maxFinite,
                        height: 60,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                TextButton(
                  onPressed: () async {
                    FormState? formState = _formKey.currentState;
                    if (formState?.validate() ?? false) {
                      formState?.save();

                      Navigator.of(context).pushNamed(RouteManager.home);
                    } else {
                      setState(() {
                        _isError = false;
                      });
                    }
                  },
                  child: Text("SAVE CHANGES"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
