import 'package:convo/Features/authorisation/screens/login_screen.dart';
import "package:flutter/material.dart";
import 'package:convo/Common/widgets/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => const LandingScreenContent(
                    image: "assets/bg.png",
                    text: "Welcome to Convo for Chatting",
                    description: "Where Every Message Matters"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LandingScreenContent extends StatelessWidget {
  const LandingScreenContent({
    super.key,
    required this.image,
    required this.text,
    required this.description,
  });

  final String image, text, description;

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500, color: Colors.black)),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: size.width * 0.75,
          child: CustomBotton(
            text: 'Continue',
            onPressed: () => navigateToLoginScreen(context),
          ),
        ),
        const Spacer()
      ],
    );
  }
}
