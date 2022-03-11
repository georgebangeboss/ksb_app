import 'package:flutter/material.dart';
import 'package:ksb_app/constants/input_decor.dart';
import 'package:ksb_app/routes/routes.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, RouteManager.logIn);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd0e7ec),
      body: Center(
        child: SizedBox(
          height: 500,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/ksb-1-logo-png-transparent.png',
                    height: 80,
                    width: 80,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "KSB ",
                    style: ksbSpanTxt,
                    children: [
                      TextSpan(
                        text: 'Supreme ',
                        style: supremeSpanTxt,
                      ),
                      TextSpan(
                        text: 'Serv',
                        style: ksbSpanTxt,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
