import 'package:devera_fitness/extensions/date_extension.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../resources/colors.dart';
import 'app_button.dart';
import 'app_text_field.dart';
import 'custom_cupertino_date_picker.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime?)? onChange;
  final String hint;
  const CustomDatePicker({super.key, this.onChange, required this.hint});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hintText: widget.hint,
      prefixIcon: Assets.images.svg.icCalendar.svg(width: 18, height: 18, color: AppColors.grayDark),
      readOnly: true,
      onTap: () {
        _showCustomDatePicker().then((value) {
              controller.text = value.convertDateTimeToString();
              widget.onChange?.call(value);
        });
      },
    );
  }

  Future<DateTime?> _showCustomDatePicker() async {
    return showModalBottomSheet<DateTime?>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          DateTime _date = DateTime.now();
          return Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CustomCupertinoDatePicker(
                    itemExtent: 50,
                    selectedDate: DateTime.now(),
                    onSelectedItemChanged: (date) {
                      if (date != _date) {
                        _date = date;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: AppButton(
                      onTap: () {
                        Navigator.pop(context, _date);
                      },
                      padding: EdgeInsets.symmetric(vertical: 16),
                      borderRadius: BorderRadius.circular(100),
                      child: Text(
                        'Choose day',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      )),
                )
              ],
            ),
          );
        });
  }
}
