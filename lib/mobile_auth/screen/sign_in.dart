import 'package:flutter/material.dart';

import 'comman_widget.dart';
import 'otp_verify.dart';

class SignMobile extends StatelessWidget {
  const SignMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    const double divider = 2.0;

    return Center(
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
            const TextViewTitle(txt: "Registration"),
            const InputTextFieldComman(
                hintText: "Enter Mobile", label: "Mobile"),
            MyBtnComman(
              txt: "Sign",
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
    );
  }
}

// Widget textView(String txt) => Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Text(
//         txt,
//         style: const TextStyle(
//           fontSize: 25,
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );

// Widget inputTextfield(String hintText, String label) => Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         maxLength: 10,
//         keyboardType: TextInputType.number,
//         decoration: InputDecoration(
//           border: const OutlineInputBorder(gapPadding: 4.0),
//           hintText: hintText,
//           label: Text(label),
//         ),
//       ),
//     );

// Widget loginBtn(String txt, VoidCallback? onPressed) => SizedBox(
//       width: double.infinity,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ElevatedButton(
//           onPressed: onPressed,
//           child: Text(txt),
//         ),
//       ),
//     );
