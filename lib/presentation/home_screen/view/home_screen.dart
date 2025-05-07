import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zappio/core/constants/colors.dart';
import 'package:zappio/presentation/waiting_screen/view/waiting_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pickupController = TextEditingController();
  final _dropController = TextEditingController();
  final _scrollController = ScrollController();

  int selectedVehicleIndex = -1;

  final List<Map<String, String>> vehicles = [
    {
      'type': 'Auto Ride',
      'time': '3 min',
      'price': '₹65',
      'image': 'assets/image/auto.png',
    },
    {
      'type': 'Mini Ride',
      'time': '4 min',
      'price': '₹80',
      'image': 'assets/image/auto.png',
    },
    {
      'type': 'Bike Ride',
      'time': '2 min',
      'price': '₹50',
      'image': 'assets/image/bike.png',
    },
    {
      'type': 'SUV Ride',
      'time': '6 min',
      'price': '₹120',
      'image': 'assets/image/car.png',
    },
    {
      'type': 'Luxury Ride',
      'time': '8 min',
      'price': '₹200',
      'image': 'assets/image/car.png',
    },
    {
      'type': 'E-Rickshaw',
      'time': '5 min',
      'price': '₹40',
      'image': 'assets/image/auto.png',
    },
  ];
  final List<Map<String, String>> suggestions = [
    {
      'type': 'Trip',
      'image': 'assets/image/car.png',
    },
    {
      'type': 'Auto',
      'image': 'assets/image/auto.png',
    },
    {
      'type': 'Bike Ride',
      'image': 'assets/image/bike.png',
    },
    {
      'type': 'Rentals',
      'image': 'assets/image/car.png',
    },
    {
      'type': 'Reserve',
      'image': 'assets/image/calender.png',
    },
    {
      'type': 'E-Rickshaw',
      'image': 'assets/image/auto.png',
    },
  ];

  @override
  void dispose() {
    _pickupController.dispose();
    _dropController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void showVehicleBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (_, scrollController) {
            return Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  Container(
                    width: 40.w,
                    height: 4.h,
                    margin: EdgeInsets.only(bottom: 12.h),
                    decoration: BoxDecoration(
                      color: ColorTheme.lightTeal,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  Text(
                    "Available Vehicles",
                    style: GoogleFonts.urbanist(
                        fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12.h),

                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: vehicles.length,
                      itemBuilder: (context, index) {
                        final vehicle = vehicles[index];
                        final isSelected = index == selectedVehicleIndex;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedVehicleIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 12.h),
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? ColorTheme.lightTeal
                                  : Colors.blue[50],
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              children: [
                                Image.network(
                                  vehicle['image']!,
                                  height: 60.h,
                                  width: 60.w,
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vehicle['type']!,
                                        style: GoogleFonts.urbanist(
                                            color: ColorTheme.black),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text("Pickup in: ${vehicle['time']}",
                                          style: GoogleFonts.urbanist(
                                              color: ColorTheme.black)),
                                      Text("Price: ${vehicle['price']}",
                                          style: GoogleFonts.urbanist(
                                              color: ColorTheme.black)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 12.h),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedVehicleIndex == -1
                          ? null
                          : () {
                              final selectedVehicle =
                                  vehicles[selectedVehicleIndex];
                              Navigator.pop(context); 
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WaitingScreen(
                                      vehicleType: selectedVehicle['type']!),
                                ),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.primaryColor,
                      ),
                      child: Text(
                        "Book Ride",
                        style: GoogleFonts.urbanist(color: ColorTheme.black),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void searchAuto() {
    if (_pickupController.text.isNotEmpty && _dropController.text.isNotEmpty) {
      showVehicleBottomSheet();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          "Please enter both locations.",
          style: GoogleFonts.urbanist(),
        )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ColorTheme.lightTeal,
          title: Text(
            "Book Your Ride",
            style: GoogleFonts.urbanist(),
          ),
          centerTitle: true,
          leading: Icon(null),
        ),
        body: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _pickupController,
                      decoration: InputDecoration(
                        labelStyle: GoogleFonts.urbanist(),
                        labelText: 'Pickup Location',
                        hintStyle: GoogleFonts.urbanist(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              20.r), 
                        ),
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: ColorTheme.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TextFormField(
                      controller: _dropController,
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.urbanist(),
                        labelText: 'Drop Location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              20.r), 
                        ),
                        prefixIcon: Icon(
                          Icons.pin_drop,
                          color: ColorTheme.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: searchAuto,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          backgroundColor: ColorTheme
                              .primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12.r),
                          ), 
                        ),
                        child: Text(
                          "Search Auto",
                          style: GoogleFonts.urbanist(
                            fontSize: 16.sp,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? ColorTheme.white
                                    : ColorTheme.black,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),
                    Text(
                      "Suggested for you",
                      style: GoogleFonts.urbanist(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: 5 / 3.8,
                      physics: const NeverScrollableScrollPhysics(),
                      children: suggestions.map((suggestion) {
                        return Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? ColorTheme.grey
                                    : ColorTheme.lightTeal,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                suggestion['image']!,
                                height: 40.h,
                                width: 40.w,
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                suggestion['type']!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.urbanist(fontSize: 12.sp),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 20.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? ColorTheme.grey
                            : ColorTheme.lightTeal,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            vehicles[0][
                                'image']!,
                            height: 100.h,
                            width: 100.w,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            '20% Discount on your Ride!',
                            style: GoogleFonts.urbanist(
                              fontSize: 18.sp,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? ColorTheme.white
                                  : ColorTheme.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            )));
  }
}
