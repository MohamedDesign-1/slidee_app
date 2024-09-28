import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_mananger.dart';

  Widget buildDropdown(
      BuildContext context, {
        required String hint,
        String? value,
        required List<String> items,
        required ValueChanged<String?> onChanged,
      }) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.iceWhite.withOpacity(0.7),
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: BorderSide.none,
        ),
      ),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

