import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

   CustomTextFormField({Key? key,
    this.controller, this.isPassword = false ,
    this.onSubmitted, this.type,
    this.onChange,  this.onTap,
     this.validate,  this.label,
     this.isSelectable, this.hint,
     this.prefix, this.suffix,
     }) : super(key: key);

  TextEditingController? controller;
  TextInputType? type;
  ValueChanged<String>? onSubmitted;
  ValueChanged<String>? onChange;
  VoidCallback ? onTap;
  bool? isSelectable;
  bool isPassword;
  FormFieldValidator<String>? validate;
  String? label;
   String? hint;
   Widget? prefix;
   Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:type,
      controller: controller,
      onFieldSubmitted: onSubmitted,
      obscureText: isPassword,
      onChanged: onChange,
      validator: validate,
      onTap: onTap,
      enabled: isSelectable,
      decoration: InputDecoration(
       labelText:label,
        hintText: hint ,
        prefixIcon: prefix,
        suffixIcon: suffix,
        border:  OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder:  OutlineInputBorder(
        borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
