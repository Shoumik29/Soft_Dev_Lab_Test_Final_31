import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/img2.png"),
            const Text("HamroMausum",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 15,),
            const Text("Made by Shoumik",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400
            ),),
            const SizedBox(height: 40,),
            const SpinKitChasingDots(
              color: Colors.black26,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlue,
    );
  }
}
