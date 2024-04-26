import 'package:flutter/material.dart';
import 'package:ecommerce_app/Login_Page.dart';

class User {
  final String fullName;
  final String email;
  final String password;

  User({
    required this.fullName,
    required this.email,
    required this.password,
  });
}

class UserData {

  static List<User> users = [];

  static bool doesUserExist(String email, String password) {
    return users.any((user) => user.email == email && user.password == password);
  }

  static void addUser(User user) {
    users.add(user);
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotateAnimation;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                                  'Secure Sign Up',
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
                    controller: fullNameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _controller.reverse().then((_) {
                        performSignup();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade700,
                    ),
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void performSignup() {
    String fullName = fullNameController.text.trim();
    String enteredEmail = emailController.text.trim();
    String enteredPassword = passwordController.text.trim();

    if (fullName.isNotEmpty && enteredEmail.isNotEmpty && enteredPassword.isNotEmpty) {
      // Check if the user already exists
      if (UserData.doesUserExist(enteredEmail, enteredPassword)) {
        print("Signup Failed: User already exists");
      } else {
        // Add the new user
        User newUser = User(fullName: fullName, email: enteredEmail, password: enteredPassword);
        UserData.addUser(newUser);

        print("Signup successful");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login_Page()));
      }
    } else {
      print("Signup Failed: Please fill in all fields");
    }
  }

  @override
  void dispose() {
    // Dispose of the animation controller
    _controller.dispose();
    super.dispose();
  }
}
