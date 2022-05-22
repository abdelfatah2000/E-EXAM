import 'package:e_exam/view/login_screen.dart';
import 'package:e_exam/view_model/auth_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const routeName = 'signup';
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isSecure = true;
  final formKey = GlobalKey<FormState>();
  final dropDownItems = ['1', '2', '3'];
   String? value;



  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var _isLoading=false;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);




    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SizedBox(
          width: deviceSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1.9,
                child: Image.asset(
                  'assest/signup.png',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
              ),
              SizedBox(
                height: deviceSize.height * .02,
              ),
              Column(
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: deviceSize.height * .045,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Please fill the inputs below here',
                    style: TextStyle(
                        fontSize: deviceSize.height * .02,
                        color: Theme.of(context).colorScheme.primary,
                        letterSpacing: deviceSize.width * .004,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: deviceSize.width * .05,
                ),
                child: SizedBox(
                  width: deviceSize.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: deviceSize.height * .04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: deviceSize.width * .42,
                            child: TextFormField(

                              controller: _firstNameController,
                              enableSuggestions: true,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelText: 'First-Name',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                prefixIcon: const Icon(
                                  Icons.title,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    4,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value != null && value.length < 4) {
                                  return 'Enter min. 5 characters';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: deviceSize.width * .42,
                            child: TextFormField(
                              controller: _lastNameController,
                              enableSuggestions: true,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelText: 'Last-Name',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                prefixIcon: const Icon(
                                  Icons.title,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    4,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value != null && value.length < 5) {
                                  return 'Enter min. 5 characters';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: deviceSize.height * .02,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        enableSuggestions: true,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Phone-Number',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              4,
                            ),
                          ),
                        ),
                        validator: (phone) {
                          if (phone != null && phone.length < 11) {
                            return 'Enter min. 11 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: deviceSize.height * .02,
                      ),
                      TextFormField(
                        controller: _emailController,
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Email-address',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              4,
                            ),
                          ),
                        ),
                        validator: (email) {
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null;
                          return null;
                        },
                      ),
                      SizedBox(
                        height: deviceSize.height * .02,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: isSecure,
                        enableSuggestions: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'password',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon: const Icon(
                            Icons.password,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isSecure = !isSecure;
                              });
                            },
                            icon: Icon(
                              isSecure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              4,
                            ),
                          ),
                        ),
                        // obscureText: isSecure,
                        validator: (pass) {
                          if (pass != null && pass.length < 7) {
                            return 'Enter min. 7 characters';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: deviceSize.height * .01,
                      ),
                  DropdownButtonFormField(

                    value: value,
                    items: dropDownItems.map(buildMenuItem).toList(),
                    onChanged: (val) {
                      setState(() {
                        value = val.toString();
                      });
                    },
                    borderRadius: BorderRadius.circular(4),
                    dropdownColor: Colors.white,
                    decoration: const InputDecoration(
                      label: Text('Level'),
                      enabled: true,
                    ),
                    validator: (value) => value == null ? 'field required' : null,
                  ),
                      SizedBox(
                        height: deviceSize.height * .025,
                      ),
                      SizedBox(
                        width: deviceSize.width * .45,
                        height: deviceSize.height * .055,
                        child:_isLoading?const Center(child: CircularProgressIndicator()): ElevatedButton(
                          onPressed: () {
                            setState((){
                              _isLoading=true;
                            });
                            final isValidForm =
                                formKey.currentState!.validate();
                            if (isValidForm) {

                              formKey.currentState!.save();
                              authProvider.signUp(
                                _firstNameController.text ,
                                _lastNameController.text,
                                _phoneController.text,
                                _emailController.text,
                                _passwordController.text,
                                value.toString(),
                              );
                              setState((){
                                _isLoading=true;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'You signed up',
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'SIGNUP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceSize.height * .018,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.primary,
                              ),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          deviceSize.height * .01)))),
                        ),
                      ),
                      SizedBox(
                        height: deviceSize.height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: deviceSize.height * .015,
                              letterSpacing: .3,
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pushReplacementNamed(
                              LoginScreen.routeName,
                            ),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: deviceSize.height * .015,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
  DropdownMenuItem<String> buildMenuItem(String item) {
    final bodyWidth = MediaQuery.of(context).size.width;
    return DropdownMenuItem(

      value: item,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: bodyWidth * .02,
        ),
        child: Text(
          item,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
