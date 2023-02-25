import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade400,
              Colors.blue.shade900,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Log in'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade800,
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {},
                      child: Text('Forgot password?'),
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
