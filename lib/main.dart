import 'package:flutter/material.dart';
import 'package:project5naz/registration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Selection',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: LanguageSelectionPage(),
    );
  }
}

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.pink,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LanguageButton(
                icon: Icons.language,
                language: 'English',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage(language: 'English')),
                  );
                },
              ),
              SizedBox(height: 20),
              LanguageButton(
                icon: Icons.language,
                language: 'Русский',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage(language: 'Русский')),
                  );
                },
              ),
              SizedBox(height: 20),
              LanguageButton(
                icon: Icons.language,
                language: 'Қазақша',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage(language: 'Қазақша')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final IconData icon;
  final String language;
  final VoidCallback onPressed;

  LanguageButton({
    required this.icon,
    required this.language,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(
        language,
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
