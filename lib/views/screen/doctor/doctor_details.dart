import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wellbyn/utils/app_icons.dart';
class DoctorDetails extends StatelessWidget {
  const DoctorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Doctor Image with icons
          Column(
            children: [
              Stack(
                children: [
                   ClipRRect(
                      child: Image.asset(
                        "assets/image/doctor_image.png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                  ),

                  Positioned(
                    top: 40, left: 16,
                    child: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
                  ),
                  Positioned(
                    top: 40, right: 16,
                    child: IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
                  ),
                ],
              ),

            ],
          ),

          // Main Dr Info Card (bottom white rounded container)
          Positioned(
            top: 300.h,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Container(height: 5, width: 40, color: Colors.grey[300])),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                        Text("Dr. Moule Marrk", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Satoshi')),
                        Text("Cardiology", style: TextStyle(color: TextColors.neutral500, fontFamily: 'Satoshi')),
                      ]),
                      Row(children: [

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: TextColors.primary500,
                              borderRadius: BorderRadius.circular(8)
                          ),child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              height: 25,
                              width: 25,
                              AppIcons.chatIcon,)),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Appcolors.secondary,
                              border: Border.all(
                                width: 2,
                                color: Colors.blue,       // specify a color
                                style: BorderStyle.solid, // optional, solid is default
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              height: 25,
                              width: 25,
                              color: Appcolors.action,
                              AppIcons.shearIcon,)),
                        ),
                      ]),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.hospitallocationIcon,color: Colors.blue),
                      SizedBox(width: 4),
                      Text("Sylhet Health Center", style: TextStyle(color: TextColors.neutral500,fontWeight: FontWeight.w400, fontFamily: 'Satoshi',fontSize: 20)),
                    ],
                  ),
                  Text(
                    "Calle Ceiba #142, Urb. Alturas de Monte Verde, Trujillo Alto, PR 00976",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12, color: Colors.grey),
                  ),

                  SizedBox(height: 20),
                  // Calendar section placeholder
                  Text("Select your date", style: TextStyle(fontWeight: FontWeight.bold)),
                  CalendarWidget(),


                  // Custom or TableCalendar here

                  // Time slots
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      OutlinedButton(onPressed: () {}, child: Text("11:45 am")),
                      ElevatedButton(onPressed: () {}, child: Text("2:15 pm")),
                      // ...other time slots
                    ],
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      OutlinedButton(onPressed: () {}, child: Text("Waitlist")),
                      SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(onPressed: () {}, child: Text("Next")),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

  }
}

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Feb 2025',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),

        // Day abbreviations
        Table(
          border: TableBorder.all(color: Colors.grey[300]!),
          children: [
            TableRow(
              children: ['Fr', 'Su', 'Mo', 'Tu', 'Sa', 'We', 'Th']
                  .map((day) => Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(day),
                ),
              ))
                  .toList(),
            ),
          ],
        ),

        // Dates grid
        Table(
          border: TableBorder.all(color: Colors.grey[300]!),
          children: [
            TableRow(
              children: [1, 2, 3, 4, 5, 6, 7]
                  .map((date) => GestureDetector(
                onTap: () => print('Selected date: $date'),
                child: Container(
                  height: 40,
                  color: date == 5 ? Colors.blue[100] : null,
                  child: Center(
                    child: Text(
                      date.toString(),
                      style: TextStyle(
                        color: date == 5 ? Colors.blue : Colors.black,
                        fontWeight: date == 5 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ))
                  .toList(),
            ),
            TableRow(
              children: [8, 9, 10, 11, 12, 13, 14]
                  .map((date) => GestureDetector(
                onTap: () => print('Selected date: $date'),
                child: Container(
                  height: 40,
                  child: Center(child: Text(date.toString())),
                ),
              ))
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }
}