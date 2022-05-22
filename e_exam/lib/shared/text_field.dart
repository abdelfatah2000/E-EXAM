import 'package:flutter/material.dart';

//otp
class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
        width: deviceSize.width * .14,
        height: deviceSize.height * .1,
        child:  TextField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: deviceSize.height*.03),
          onChanged: (ctx){
            FocusScope.of(context).nextFocus();
          },
          maxLength: 1,
          textInputAction: TextInputAction.next,
          autofocus: true,

          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),);
  }
}
