import 'package:flutter/material.dart';
import 'package:ecommerce_app/greeting_Screen.dart';
import 'package:ecommerce_app/signup_Page.dart';

class Login_Page extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotateAnimation;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loginAttempted = false;
  bool loginSuccessful = false; // Added flag to track login success

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Initialize fade animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    // Initialize rotate animation
    _rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Unique design element at the bottom
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                // Animated fading and rotating welcome message
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotateAnimation.value * 2 * 3.14, // Rotate 2*pi radians
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.lock,
                                  size: 80,
                                  color: Colors.grey.shade300,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Secure Login',
                                  style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                      errorText: (loginAttempted && !loginSuccessful && emailController.text.isEmpty) ||
                              (loginAttempted && !loginSuccessful)
                          ? 'Please enter a valid email'
                          : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      errorText: (loginAttempted && !loginSuccessful && passwordController.text.isEmpty) ||
                              (loginAttempted && !loginSuccessful)
                          ? 'Please enter a valid password'
                          : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _controller.reverse().then((_) {
                        setState(() {
                          loginAttempted = true;
                        });
                        performLogin();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade700,
                    ),
                    child: Text('Login'),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      _controller.reverse().then((_) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade700,
                    ),
                    child: Text('Signup '),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void performLogin() {
    String enteredEmail = emailController.text.trim();
    String enteredPassword = passwordController.text.trim();

    if (enteredEmail.isEmpty || enteredPassword.isEmpty) {
      setState(() {
        loginSuccessful = false;
      });
      return;
    }

    bool isValidUser = UserData.doesUserExist(enteredEmail, enteredPassword);

    if (isValidUser) {
      setState(() {
        loginSuccessful = true;
      });

      // Complete the animation when login is successful
      _controller.reverse().then((_) =>
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GreetingScreen())));
    } else {
      setState(() {
        loginSuccessful = false;
      });
    }
  }

  @override
  void dispose() {
    // Dispose of the animation controller
    _controller.dispose();
    super.dispose();
  }
}
