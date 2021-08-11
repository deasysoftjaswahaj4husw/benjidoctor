import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:benjidoctor/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const BenjiDoctor());
}

class BenjiDoctor extends StatelessWidget {
  const BenjiDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Benji Doctor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
