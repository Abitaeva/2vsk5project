import 'package:flutter/material.dart';
import 'package:project5naz/BottomNavigationBar.dart';

class RegistrationPage extends StatefulWidget {
  final String language;

  RegistrationPage({required this.language});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isPasswordVisible = false;
  final _passwordController = TextEditingController();

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    // Проверяем, содержит ли пароль хотя бы одну цифру
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    // Проверяем, содержит ли пароль символ в верхнем регистре
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    // Пароль соответствует всем условиям
    return null;
  }

  void _register() {
    if (_passwordController.text.isNotEmpty) {
      // Если пароль не пустой, переходим на главную страницу с BottomNavigationBar
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Registration Form',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              maxLength: 9,
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextFormField(
              maxLength: 9,
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            TextFormField(
              maxLength: 11,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              maxLength: 9,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              validator: _validatePassword,
            ),
            DropdownButtonFormField<String>(
              value: widget.language,
              items: <String>['English', 'Русский', 'Қазақша']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle language change
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}
