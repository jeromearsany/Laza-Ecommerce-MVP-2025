import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import 'home_screen.dart'; // Import Home Screen so we can navigate to it

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.deepPurple),
              ),
              const SizedBox(height: 30),
              Text(
                _isLogin ? "Welcome Back!" : "Let's Get Started", 
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple)
              ),
              const SizedBox(height: 10),
              Text(
                _isLogin ? "Please sign in to continue" : "Create an account to browse products",
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 40),
              
              if (!_isLogin)
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline),
                      labelText: "Full Name",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                
              TextField(
                controller: _emailController, 
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  labelText: "Email", 
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white,
                )
              ),
              const SizedBox(height: 15),
              
              TextField(
                controller: _passController, 
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  labelText: "Password", 
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), 
                  filled: true,
                  fillColor: Colors.white,
                ), 
                obscureText: true
              ),
              const SizedBox(height: 30),
              
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 5,
                  ),
                  onPressed: () async {
                    String? error;
                    if (_isLogin) {
                      // LOGIN LOGIC
                      error = await auth.signIn(_emailController.text, _passController.text);
                      
                      // *** THE FIX IS HERE ***
                      if (error == null && mounted) {
                         // Force navigation to Home Screen on success
                         Navigator.of(context).pushAndRemoveUntil(
                           MaterialPageRoute(builder: (_) => const HomeScreen()), 
                           (route) => false
                         );
                      }
                    } else {
                      // SIGNUP LOGIC
                      if (_nameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter your name")));
                        return;
                      }
                      error = await auth.signUp(_emailController.text, _passController.text, _nameController.text);
                      
                      if (error == null) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Account created! Please Login."), backgroundColor: Colors.green)
                          );
                          setState(() {
                            _isLogin = true;
                            _passController.clear();
                          });
                        }
                        return;
                      }
                    }

                    if (error != null && mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error), backgroundColor: Colors.red));
                    }
                  },
                  child: Text(_isLogin ? "Login" : "Sign Up", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin;
                    _passController.clear();
                  });
                },
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(text: _isLogin ? "New here? " : "Already have an account? "),
                      TextSpan(
                        text: _isLogin ? "Create Account" : "Login",
                        style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}