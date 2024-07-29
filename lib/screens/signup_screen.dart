import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:proj_amr_ecommerce/screens/success_screen.dart';
import 'package:proj_amr_ecommerce/widgets/passwordfield_widget.dart';
import 'package:proj_amr_ecommerce/widgets/primary_btn_widget.dart';
import 'package:proj_amr_ecommerce/widgets/textfield_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  late Box userBox;
  bool isAgree = false;

  @override
  void initState() {
    super.initState();
    createBox();
  }

  void createBox() async {
    userBox = await Hive.openBox<Map>('users');
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
                    Text("Sign Up",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(
                      "Create a new account",
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ),
              // 1. TextfieldWidget+
              TextfieldWidget(
                input: "User Name",
                hint: "Please enter your name",
                suffixIcon: const Icon(Icons.check_circle),
                controller: nameController,
              ),
              TextfieldWidget(
                input: "Email",
                hint: "Please enter your email",
                controller: emailController,
              ),
              // 2. PasswordfieldWidget+
              PasswordfieldWidget(
                input: "Password",
                controller: passwordController,
              ),
              PasswordfieldWidget(
                input: "Confirm Password",
                controller: passwordConfirmController,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: isAgree,
                      activeColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          isAgree = !isAgree;
                        });
                      }),
                  Text(
                    "By creating an account you accept our terms\nand conditions",
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              // 3. PrimaryBtnWidget+
              PrimaryBtnWidget(
                btnChild: const Text("Sign Up"),
                onPressed: () {
                  if (isAgree) {
                    addUser();
                  } else if (!isAgree) {
                    print("User hasn't agreed to terms");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addUser() async {
    if (passwordController.text == passwordConfirmController.text) {
      final userBox = Hive.box<Map>('users');
      final user = {
        "username": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      };
      await userBox.add(user);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessScreen(),
        ),
      );
      print("User Data Stored in Hive");
    } else {
      print("Wrong Data");
    }
  }
}
