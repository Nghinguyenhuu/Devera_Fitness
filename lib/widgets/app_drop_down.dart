import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../resources/colors.dart';

class AppDropdownButton extends StatefulWidget {
  final Function(String) onChange;
  final String hint;
  final List<String> items;
  final Widget? icon;
  final Widget? prefixIcon;

  const AppDropdownButton({
    super.key,
    required this.onChange,
    required this.hint,
    required this.items,
    this.prefixIcon,
    this.icon,
  });

  @override
  State<AppDropdownButton> createState() => _AppDropdownButtonState();
}

class _AppDropdownButtonState extends State<AppDropdownButton> {
  BehaviorSubject<String?> valueStream = BehaviorSubject();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: StreamBuilder<String?>(
          stream: valueStream,
          builder: (context, snapshot) {
            return DropdownButtonFormField<String>(
              value: snapshot.data,
              isExpanded: true,
              icon: widget.icon,
              alignment: Alignment.centerLeft,
              items: widget.items
                  .map((e) => DropdownMenuItem<String>(
                        child: Text(
                          e,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                        value: e,
                      ))
                  .toList(),
              onChanged: (String? value) {
                if (value != null) {
                  valueStream.add(value);
                  widget.onChange.call(value);
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
              style: Theme.of(context).textTheme.labelMedium,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.gray),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 10),
                  child: widget.prefixIcon,
                ),
                constraints: BoxConstraints(maxHeight: 48),
                prefixIconConstraints: BoxConstraints(maxWidth: 60),
                suffixIconConstraints: BoxConstraints(maxWidth: 60),
                filled: true,
                fillColor: AppColors.border,
                errorStyle: TextStyle(height: 0),
                contentPadding: EdgeInsets.all(16),
                border: _buildOutlineInputBorder(),
                enabledBorder: _buildOutlineInputBorder(),
                focusedBorder: _buildOutlineInputBorder(),
                errorBorder: _buildOutlineInputBorder(color: Colors.red),
              ),
            );
          }),
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
}
