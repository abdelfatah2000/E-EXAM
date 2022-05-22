import 'package:e_exam/shared/text_field.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);
  static const routeName = 'verification';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: deviceSize.width,
          child: Column(
            children: [
              SizedBox(
                width: deviceSize.width * .8,
                child: Image.asset(
                  'assest/otp.jpg',
                  filterQuality: FilterQuality.low,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: deviceSize.height * .02,
              ),
              Text(
                'Enter Your OTP',
                style: TextStyle(
                  fontSize: deviceSize.height * .04,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: deviceSize.height * .035,
              ),
              SizedBox(
                width: deviceSize.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomTextField(),
                    SizedBox(
                      width: deviceSize.width * .012,
                    ),
                    const CustomTextField(),
                    SizedBox(
                      width: deviceSize.width * .012,
                    ),
                    const CustomTextField(),
                    SizedBox(
                      width: deviceSize.width * .012,
                    ),
                    const CustomTextField(),
                    SizedBox(
                      width: deviceSize.width * .012,
                    ),
                    const CustomTextField(),
                    SizedBox(
                      width: deviceSize.width * .012,
                    ),
                    SizedBox(
                      width: deviceSize.width * .14,
                      height: deviceSize.height * .1,
                      child:  TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: deviceSize.height*.03,),

                        onChanged: (ctx){
                          FocusScope.of(context).unfocus();
                        },
                        maxLength: 1,
                        textInputAction: TextInputAction.done,
                        autofocus: true,

                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),)

                  ],
                ),
              ),
              SizedBox(
                height: deviceSize.height*.04,
              ),
              SizedBox(
                width: deviceSize.width*.4,
                height: deviceSize.height * .06,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: deviceSize.height * .02,
                    ),
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(20),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(deviceSize.height*.02,),),),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.green,
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
