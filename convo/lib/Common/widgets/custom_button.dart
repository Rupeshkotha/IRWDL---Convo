import "package:flutter/material.dart";


class CustomBotton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomBotton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
       style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amberAccent,
          minimumSize: const Size(double.infinity, 50)
          ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
