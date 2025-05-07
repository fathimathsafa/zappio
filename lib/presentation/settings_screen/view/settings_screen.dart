import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zappio/core/constants/colors.dart';
import 'package:zappio/core/constants/theme.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.lightTeal,
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.w,
              backgroundImage: NetworkImage('https://i.imgur.com/zL4Krbz.png'),
            ),
            SizedBox(height: 12.h),
            Text(
              'Arun',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.h),
            ListTile(
              title: Text(
                'About Us',
                style: GoogleFonts.urbanist(color: ColorTheme.primaryColor),
              ),
              leading: Icon(
                Icons.info_outline,
                color: ColorTheme.primaryColor,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text('FAQ',
                  style: GoogleFonts.urbanist(color: ColorTheme.primaryColor)),
              leading: Icon(
                Icons.help_outline,
                color: ColorTheme.primaryColor,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text('Terms & Conditions',
                  style: GoogleFonts.urbanist(color: ColorTheme.primaryColor)),
              leading: Icon(
                Icons.description,
                color: ColorTheme.primaryColor,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text('Change Theme',
                  style: GoogleFonts.urbanist(color: ColorTheme.primaryColor)),
              leading: Icon(
                Icons.brightness_6,
                color: ColorTheme.primaryColor,
              ),
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.isDarkMode = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
