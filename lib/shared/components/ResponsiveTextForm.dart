
import 'package:flutter/material.dart';
import 'package:online_election_system/shared/components/responsive_class.dart';
import 'package:online_election_system/shared/constants/colors.dart';



class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  late double _width;
  late double _pixelRatio;
  late bool large;
  late bool medium;
  Function(String) onChanged;
  FormFieldValidator<String> validator;


  CustomTextField({
    required this.validator,
    required this.onChanged,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    required this.icon,
    this.obscureText = false,
    required MaterialColor color,
  });

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(25.0),
      elevation: large ? 7 : (medium ? 7 : 7),
      child: TextFormField(
        obscureText: obscureText,
        controller: textEditingController,
        onChanged: onChanged,
        keyboardType: keyboardType,
        validator: validator,
        cursorColor: b2,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blueAccent, size: 20),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

}




