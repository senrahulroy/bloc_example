import 'package:flutter/material.dart';

import 'comman_widget.dart';

class OtpVerifyPage extends StatelessWidget {
  const OtpVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    const double divider = 2.0;
    return Material(
      child: Center(
        child: Container(
          height: height / divider,
          width: width / divider,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(
                5.0,
                5.0,
              ), //Offset
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ]),
          child: Column(
            children: [
              const TextViewTitle(txt: "Verify OTP"),
              const InputTextFieldComman(hintText: "6 - Degital", label: "OTP"),
              MyBtnComman(
                txt: "Verify",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => const OtpVerifyPage(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
