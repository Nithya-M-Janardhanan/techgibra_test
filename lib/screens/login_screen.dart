import 'package:flutter/material.dart';
import 'package:techgebra/screens/profile_screen.dart';
import 'package:techgebra/storage/sharedpref.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool enableObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'WhatsAppShop',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Enter Email / Mobile Number',
                              filled: true,
                              fillColor: Colors.grey,
                              border: InputBorder.none,
                            ),
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter email or mobile number';
                              }else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !enableObscure,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              filled: true,
                              fillColor: Colors.grey,
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    enableObscure = !enableObscure;
                                  });
                                },
                                child: enableObscure
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                              ),
                            ),
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Password must not be Empty';
                              } else if (value.length < 6) {
                                return 'Password must be more than 6 characters';
                              } else if (!value.contains(RegExp(r'[0-9]'))) {
                                return 'Password must be contain one number';
                              } else if (!value.contains(RegExp(r'[#?!@$%^&*-]'))) {
                                return 'Password must be contain one special character';
                              } else if (!value.contains(RegExp(r'[A-Z]'))) {
                                return 'Password must be contain one Uppercase letter';
                              } else if (!value.contains(RegExp(r'[a-z]'))) {
                                return 'Password must be contain one lowercase letter';
                              }
                              return null;
                            },
                          )
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        FocusScope.of(context).unfocus();
                        SharedPreferenceHelper.setUsername(_emailController.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // RichText(textAlign: TextAlign.end,text: TextSpan(text: 'Forgot Password',style: TextStyle(color: Colors.red))),
                  Center(
                      child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.end,
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Dont have an account?',
                          style: TextStyle(color: Colors.grey)),
                      TextSpan(
                          text: 'REGISTER',
                          style: TextStyle(color: Colors.green)),
                    ])),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
