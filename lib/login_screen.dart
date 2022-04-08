import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelance/detail_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 160,
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) =>
                          const CircularProgressIndicator(
                        color: Color(0xffF14844),
                      ),
                      imageUrl: 'https://demo.medrpha.com/images/logo-1.png',
                      fit: BoxFit.fill,
                    )),
                const SizedBox(
                  height: 50,
                ),
                const FormFields(
                  label: 'Email',
                  obsecure: false,
                  type: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 25,
                ),
                const FormFields(
                  label: 'Password',
                  obsecure: true,
                  type: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 40,
                ),
                const LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const DetailScreen()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffF14844),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
    );
  }
}

class FormFields extends StatelessWidget {
  const FormFields({
    required this.label,
    required this.obsecure,
    required this.type,
    Key? key,
  }) : super(key: key);

  final String label;
  final TextInputType type;
  final bool obsecure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        hintText: label,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1.5)),
      ),
      obscureText: obsecure,
      keyboardType: type,
    );
  }
}
