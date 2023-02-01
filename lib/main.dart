import 'package:flutter/material.dart';
import 'package:untitled/Login_Page.dart';
import 'package:untitled/Sign_page.dart';
import 'package:untitled/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/views/homPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isSplash = prefs.getBool('isSplash') ?? false;
  bool? isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: (isSplash == false)
        ? 'splash'
        : (isLoggedIn == false)
            ? 'logIn_Page'
            : '/',
    routes: {
      '/': (context) => const HomePgae1(),
      'splash': (context) => const SplashScreen(),
      'signIn_Page': (context) => const SignInPage(),
      'logIn_Page': (context) => const LogInPage(),
    },
  ));
}
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

// appBar: AppBar(
//   title: const Text(
//     "Home Page",
//     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//   ),
//   actions: [
//     IconButton(
//         onPressed: () async {
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//
//           prefs.remove('isLoggedIn');
//
//           Navigator.of(context).pushNamedAndRemoveUntil('logIn_Page', (route) => false);
//         },
//         icon: const Icon(Icons.power_settings_new_outlined)),
//   ],
//   centerTitle: true,
//   backgroundColor: Colors.black,
// ),
