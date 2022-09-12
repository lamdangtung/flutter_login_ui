import 'package:flutter/material.dart';
import 'package:flutter_login_ui/text_field_widget.dart';
import 'package:flutter_login_ui/wave_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: size.height - 200,
            color: Colors.lightBlue,
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: isKeyboardOpen ? -size.height / 4.5 : 0,
            curve: Curves.easeInOut,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Login",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.white)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFieldWidget(
                  controller: emailController,
                  onChanged: (newVal) {},
                  hintText: "Email",
                  obscureText: false,
                  prefixIconData: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFieldWidget(
                  onChanged: (newVal) {},
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: isVisible,
                  prefixIconData: Icons.lock_outline,
                  suffixIconData: isVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.lightBlue.withOpacity(0.8),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                            color: Colors.lightBlue, width: 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
