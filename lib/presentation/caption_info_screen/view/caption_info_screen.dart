import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zappio/core/constants/colors.dart';
import 'package:zappio/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:zappio/presentation/home_screen/view/home_screen.dart';

class CaptainInfoScreen extends StatelessWidget {
  final String vehicleType;

  const CaptainInfoScreen({super.key, required this.vehicleType});

  @override
  Widget build(BuildContext context) {
    const captainName = 'John Doe';
    const vehicleNo = 'ABC 1234';
    const estimatedTime = '10 mins';

    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorTheme.lightTeal,
          centerTitle: true,
          leading: Icon(null),
          title: Text(
            "Captain Info",
            style: GoogleFonts.urbanist(),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 80.sp,
                color: ColorTheme.primaryColor,
              ),
              SizedBox(height: 20.h),
              Text(
                "Captain: $captainName",
                style: GoogleFonts.urbanist(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Vehicle No: $vehicleNo",
                style: GoogleFonts.urbanist(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Estimated Time: $estimatedTime",
                style: GoogleFonts.urbanist(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Happy Journey!',
                          style: GoogleFonts.urbanist(),
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );

                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavigationScreen()));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    backgroundColor: ColorTheme.primaryColor,
                  ),
                  child: Text(
                    "Start Ride",
                    style: GoogleFonts.urbanist(
                      fontSize: 16.sp,
                      color: ColorTheme.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
