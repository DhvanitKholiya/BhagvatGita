import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

bool checkBox = false;
  GlobalKey<FormState> logInPageKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/My_Images/login bg3.jpg'),fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.all(20),
        child: Form(
          key: logInPageKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 120,),
              const Align(
                alignment: Alignment(-0.9, 0),
                child: Text(
                  "Log In",
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
                onSaved: (val) {},
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
                onSaved: (val) {},
                decoration: const InputDecoration(
                  hintText: "Enter Your password",
                  labelText: "password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: checkBox, onChanged: (val){
                setState(() {
                  checkBox = val!;
                });
              },title: const Text("Remember me"),),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {

                    if(logInPageKey.currentState!.validate()) {
                      logInPageKey.currentState!.save();

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setBool('isLoggedIn', true);

                      Navigator.of(context).pushReplacementNamed('/');
                    }
                  },
                  child: const Text("Log in")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('signIn_Page');
                  },
                  child: const Text("Create New Account")),
            ],
          ),
        ),
      ),
    );
  }
}
