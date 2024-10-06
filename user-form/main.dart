import 'package:dummy/home_screen.dart';
import 'package:dummy/text_validator.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.blue[50],
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 8,
            ),
          )),
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            // Hide keyboard when tapping outside
            FocusScope.of(context).unfocus();
          },
          child: Container(
            // Gradient background
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Colors.lightBlueAccent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(child: MyFormCard()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyFormCard extends StatelessWidget {
  const MyFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'User Form',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            MyForm(),
          ],
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
// Instances of callable objects for validation
  final TextValidator emailValidator = TextValidator('email');
  final TextValidator usernameValidator = TextValidator('username');
  final TextValidator passwordValidator = TextValidator('password');

  String email = '';
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email Field
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) => emailValidator(value!),
            onChanged: (value) => email = value,
          ),
          const SizedBox(height: 20),

          // Username Field
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Username',
              hintText: 'Choose a username',
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) => usernameValidator(value!),
            onChanged: (value) => username = value,
          ),
          const SizedBox(height: 20),

          // Password Field
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) => passwordValidator(value!),
            onChanged: (value) => password = value,
          ),
          const SizedBox(height: 30),

          // Submit Button
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              }
            },
            child: const Text(
              'Submit',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
