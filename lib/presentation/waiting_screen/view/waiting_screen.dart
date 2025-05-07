import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zappio/core/constants/colors.dart';
import 'package:zappio/presentation/caption_info_screen/view/caption_info_screen.dart';

class WaitingScreen extends StatelessWidget {
  final String vehicleType;

  const WaitingScreen({super.key, required this.vehicleType});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CaptainInfoScreen(vehicleType: vehicleType),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.lightTeal,
        leading: const SizedBox.shrink(),
        centerTitle: true,
        title: Text(
          "Ride Booking",
          style: GoogleFonts.urbanist(
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
              ),
              SizedBox(height: 24.h),
              Text(
                "Waiting for your driver to pick up the ride...",
                style: GoogleFonts.urbanist(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? ColorTheme.white
                      : ColorTheme.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                "Vehicle: $vehicleType",
                style: GoogleFonts.urbanist(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
