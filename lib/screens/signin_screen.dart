import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ionicons/ionicons.dart';
import 'package:proj_amr_ecommerce/screens/categories_screen.dart';
import 'package:proj_amr_ecommerce/widgets/passwordfield_widget.dart';
import 'package:proj_amr_ecommerce/widgets/primary_btn_widget.dart';
import 'package:proj_amr_ecommerce/widgets/textfield_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isRemember = false;
  late Box userBox;
  late Box savedUserBox;

  @override
  void initState() {
    super.initState();
    createBox();
  }

  void createBox() async {
    userBox = await Hive.openBox<Map>('users');
    savedUserBox = await Hive.openBox<dynamic>('savedUser');
    restoreSession();
  }

  void restoreSession() async {
    if (savedUserBox.get("savedEmail") != null) {
      emailController.text = savedUserBox.get("savedEmail");
      passwordController.text = savedUserBox.get("savedPassword");

      setState(() {
        isRemember = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(top: 24, bottom: 24),
                child: Image.asset(
                  'assets/images/logo-b.png',
                  height: 120,
                  width: double.infinity,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome!",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(
                      "Please login or sign up to continue with our app",
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ),
              // 1. TextfieldWidget+
              TextfieldWidget(
                input: "Email",
                hint: "Please enter your email",
                suffixIcon: const Icon(Icons.check_circle),
                controller: emailController,
              ),
              // 2. PasswordfieldWidget+
              PasswordfieldWidget(
                input: "Password",
                controller: passwordController,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      value: isRemember,
                      activeColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          isRemember = !isRemember;
                        });
                      }),
                  const Text("Remember Me"),
                ],
              ),
              // 3. PrimaryBtnWidget+
              PrimaryBtnWidget(
                btnChild: const Text("Login"),
                onPressed: () {
                  login();
                },
              ),
              const SizedBox(height: 16),
              Row(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Divider(
                      color: Colors.grey[300],
                      height: 0.5,
                    ),
                  ),
                ),
                const Text(
                  "or",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Divider(
                      color: Colors.grey[300],
                      height: 0.5,
                    ),
                  ),
                ),
              ]),
              PrimaryBtnWidget(
                  btnBgColor: const Color(0xFF3b5999),
                  btnChild: const Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 64),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.logo_facebook,
                          size: 20,
                        ),
                        SizedBox(width: 12),
                        Text("Continue with Facebook"),
                      ],
                    ),
                  ),
                  onPressed: () {}),
              PrimaryBtnWidget(
                  btnBgColor: Colors.white,
                  btnBorderColor: const Color.fromARGB(255, 220, 220, 220),
                  btnBorderWidth: 0.6,
                  btnTxtColor: Colors.grey[600],
                  btnChild: const Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 64),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.logo_google,
                          size: 20,
                          color: Colors.black,
                        ),
                        SizedBox(width: 12),
                        Text("Continue with Google"),
                      ],
                    ),
                  ),
                  onPressed: () {}),
              PrimaryBtnWidget(
                  btnBgColor: Colors.white,
                  btnBorderColor: const Color.fromARGB(255, 220, 220, 220),
                  btnBorderWidth: 0.6,
                  btnTxtColor: Colors.grey[600],
                  btnChild: const Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 64),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.logo_apple,
                          size: 20,
                          color: Colors.black,
                        ),
                        SizedBox(width: 12),
                        Text("Continue with Apple"),
                      ],
                    ),
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    final userBox = Hive.box<Map>('users');
    bool userExists = false;

    for (var i = 0; i < userBox.length; i++) {
      Map? user = userBox.getAt(i);
      if (user != null &&
          user['email'] == emailController.text &&
          user['password'] == passwordController.text) {
        userExists = true;
        break;
      }
    }

    if (userExists) {
      if (isRemember) {
        savedUserBox.put("savedEmail", emailController.text);
        savedUserBox.put("savedPassword", passwordController.text);
        print("User session is saved");
      } else if (!isRemember) {
        savedUserBox.delete("savedEmail");
        savedUserBox.delete("savedPassword");
        print("User session is not saved");
      }

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        ),
        (route) => false,
      );
    } else {
      print("User doesn't exist. Please create an account first");
    }
  }
}
