import 'package:flutter/material.dart';
import 'package:practice_application/Widgets/custom_button.dart';
import 'package:practice_application/Widgets/custom_textfield.dart';
import 'package:practice_application/assets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Assets.logo_colored),
                  Image.asset(Assets.veg_bowl_image),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0DCBA8)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('Please sign in your account to get started!'),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextfield(
                      controller: emailController,
                      labelText: 'Email',
                      hint: 'nishan@gmail.com',
                      inputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextfield(
                      controller: passwordController,
                      labelText: 'Password',
                      hint: 'Enter your password',
                      isobscureText: true,
                      suffixIcon: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot?',
                          style: TextStyle(
                              color: Color(0xff182A6D),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // const CustomButton(title: 'Sign In', onClick: (){}),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff182A6D)),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
