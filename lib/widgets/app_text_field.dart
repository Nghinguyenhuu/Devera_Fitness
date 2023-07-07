import 'package:devera_fitness/widgets/ink_well_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../gen/assets.gen.dart';
import '../resources/colors.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final Function()? onTap;
  final Function(String)? onChange;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final bool isPassword;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    required this.hintText,
    this.onTap,
    this.readOnly = false,
    this.onChange,
    this.controller,
    this.inputFormatters,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  TextEditingController _controller = TextEditingController();
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    hidePassword = widget.isPassword;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
        onTap: widget.onTap,
        controller: widget.controller ?? _controller,
        readOnly: widget.readOnly,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
        onChanged: (value) {
          if (value.trim().isNotEmpty) {
            widget.onChange?.call(value.trim());
          }
        },
        obscureText: hidePassword,
        style: Theme.of(context).textTheme.labelMedium,
        decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.gray),
            border: _buildOutlineInputBorder(),
            errorStyle: TextStyle(height: 0),
            focusedBorder: _buildOutlineInputBorder(),
            enabledBorder: _buildOutlineInputBorder(),
            disabledBorder: _buildOutlineInputBorder(),
            errorBorder: _buildOutlineInputBorder(color: Colors.red),
            fillColor: AppColors.border,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 16, right: 10),
              child: widget.prefixIcon,
            ),
            constraints: BoxConstraints(maxHeight: 48),
            prefixIconConstraints: BoxConstraints(maxWidth: 60),
            suffixIconConstraints: BoxConstraints(maxWidth: 60),
            suffixIcon: widget.isPassword ? buildHideIcon() : widget.suffixIcon,
            counterText: '',
            filled: true,
            contentPadding: EdgeInsets.all(16)),
      ),
    );
  }

  _buildOutlineInputBorder({Color color = AppColors.border}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          width: 2,
          color: color,
        ));
  }

  Widget buildHideIcon() {
    var icon = Assets.images.svg.icShow;
    if (hidePassword) {
      icon = Assets.images.svg.icHide;
    }
    return InkWellWrapper(
        onTap: () {
          setState(() {
            hidePassword = !hidePassword;
          });
        },
        paddingChild: EdgeInsets.all(16),
        borderRadius: BorderRadius.circular(16),
        child: icon.svg(width: 18, height: 18, fit: BoxFit.fill, color: AppColors.gray));
  }
}
