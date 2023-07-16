import 'package:flutter/material.dart';

import '../../infrastructure/helpers/colors_app.dart';
import '../../infrastructure/helpers/text_style_app.dart';

class TextFieldApp extends StatelessWidget {
  final Color fillColor;
  final IconData? prefixIcon;
  final String? labelText;
  final IconData? suffix;
  final VoidCallback? onTabSuffix;
  final bool obscureText;
  final FormFieldValidator? validator;
  final TextEditingController? controller;

  const TextFieldApp({
    Key? key,
    this.fillColor = ColorsApp.kcVeryLightGrey,
    this.prefixIcon,
    this.labelText,
    this.suffix,
    this.onTabSuffix,
    this.obscureText = false,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          style: TextStyleApp.text12w700,
          decoration: InputDecoration(
            suffix: suffix == null
                ? null
                : IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: onTabSuffix,
                    icon: Icon(
                      suffix,
                      color: ColorsApp.kcPrimaryColorDark,
                    ),
                  ),
            contentPadding: const EdgeInsets.all(8),
            prefixIcon: prefixIcon == null
                ? null
                : Icon(
                    prefixIcon,
                    color: ColorsApp.kcPrimaryColorDark,
                  ),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: fillColor,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.lightBlue,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            errorBorder: const OutlineInputBorder(
              gapPadding: 16,
              borderSide: BorderSide(
                color: Colors.redAccent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              gapPadding: 16,
              borderSide: BorderSide(
                color: Colors.redAccent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            fillColor: fillColor,
            filled: true,
          ),
          validator: validator,
        ),
        Positioned(
          top: 4,
          left: 50,
          child: Text(
            labelText ?? '',
            style: TextStyleApp.text10w400.copyWith(
              color: ColorsApp.kcPrimaryColorDark,
            ),
          ),
        ),
      ],
    );
  }
}
