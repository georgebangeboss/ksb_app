import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
  Locator read;

  String? email;
  String? jobId;
  String? password;
  int? userId;
  String? role;
  LoginNotifier(this.read) {
    _loadEmailPasswordRoleJobId();
  }

  void setEmail(String myEmail) async {
    email = myEmail;
    notifyListeners();
    await _saveEmail();
  }

  void setPassword(String myPassword) async {
    password = myPassword;
    notifyListeners();
    await _savePassword();
  }

  void setJobId(String jobId) async {
    jobId = jobId;
    notifyListeners();
    await _saveJobId();
  }

  void setId(int myId) async {
    userId = myId;
    notifyListeners();
    await _saveId();
  }

  void setRole(String myRole) async {
    role = myRole;
    notifyListeners();
    await _saveRole();
  }

  Future<void> _saveEmail() async {
    await SharedPreferences.getInstance().then((prefs) {
      if (email != null) {
        prefs.setString('email', email!);
      }
    });
  }

  Future<void> _saveJobId() async {
    await SharedPreferences.getInstance().then((prefs) {
      if (jobId != null) {
        prefs.setString('jobId', jobId!);
      }
    });
  }

  Future<void> _savePassword() async {
    await SharedPreferences.getInstance().then((prefs) {
      if (password != null) {
        prefs.setString('password', password!);
      }
    });
  }

  Future<void> _saveId() async {
    await SharedPreferences.getInstance().then((prefs) {
      if (userId != null) {
        prefs.setInt('id', userId!);
      }
    });
  }

  Future<void> _saveRole() async {
    await SharedPreferences.getInstance().then((prefs) {
      if (role != null) {
        prefs.setString('roles', role!);
      }
    });
  }

  Future<void> _loadEmailPasswordRoleJobId() async {
    await SharedPreferences.getInstance().then((prefs) {
      email = prefs.getString('email');
      password = prefs.getString('password');
      role = prefs.getString('role');
      jobId = prefs.getString('jobId');
    });
  }

  @override
  String toString() {
    StringBuffer sb = StringBuffer("*********LOGIN DETAILS: ********* \n");

    sb.write("email : ");
    sb.write(email ?? "NULLL");
    sb.write("\n");

    sb.write("job id: ");
    sb.write(jobId ?? "NULLL");
    sb.write("\n");

    sb.write("password : ");
    sb.write(password ?? "NULLL");
    sb.write("\n");

    return sb.toString();
  }
}
