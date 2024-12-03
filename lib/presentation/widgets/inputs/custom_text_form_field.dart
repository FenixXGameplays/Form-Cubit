// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final IconData? prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? errorMessage;
  final bool? isPassword;
  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.prefixIcon,
    required this.onChanged,
    this.validator,
    this.isPassword,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      //borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(20),
    );
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      validator: validator,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        isDense: true,
        label: Text(label ?? ""),
        errorText: errorMessage,
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: colors.error)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: colors.error)),
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}
