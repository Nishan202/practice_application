import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  // final VoidCallback onTap;
  final bool loading;
  const CustomButton({super.key, required this.title, this.loading=false,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xff002967),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(child: loading ? const CircularProgressIndicator(strokeWidth: 3, color: Colors.white,) : Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),),
      ),
    );
  }
}