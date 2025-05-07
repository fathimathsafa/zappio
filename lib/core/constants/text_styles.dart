import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class GLTextStyles {
  static TextStyle appNameStyle(BuildContext context) {
    return GoogleFonts.luckiestGuy(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: ColorTheme.primaryColor,
      letterSpacing: 1.5,
    );
  }

  static TextStyle subAppNameStyle(BuildContext context) {
    return GoogleFonts.luckiestGuy(
      fontSize: 10.sp,
      fontWeight: FontWeight.normal,
      color: ColorTheme.primaryColor,
      letterSpacing: 1.5,
    );
  }
}
