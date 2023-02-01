import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> pageKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/My_Images/login bg4.jpg'),
            fit: BoxFit.cover
          )
        ),
        padding: const EdgeInsets.all(20),
        child: Form(
          key: pageKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 120,),
              const SizedBox(height: 15,),
              const Align(
                alignment: Alignment(-0.9, 0),
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter First Your email....";
                  }
                  return null;
                },
                onSaved: (val) {
                  emailController.text;
                },
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Enter Your Email I'D",
                  labelText: "email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter First Your password....";
                  }
                  return null;
                },
                onSaved: (val) {
                  passwordController.text;
                },
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "create your password",
                  labelText: "password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if(pageKey.currentState!.validate()) {
                      pageKey.currentState!.save();

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setBool('isSignUp', true);

                      Navigator.of(context).pushReplacementNamed('logIn_Page');
                    }
                  },
                  child: const Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
