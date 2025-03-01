import 'package:adhicine/screens/Profile.dart';
import 'package:adhicine/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/navigateWithSlideTransition.dart';
import '../widgets/MedicineCard.dart';
import 'AppDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // State to track the currently displayed date
  DateTime currentDate = DateTime.now();

  // Function to update the displayed date by adding or subtracting days
  void updateDate(int days) {
    setState(() {
      currentDate = currentDate.add(Duration(days: days));
    });
  }
  List<Map<String, dynamic>> todayMedicines = [
    {
      'time': 'Morning 08:00 am',
      'color': Colors.pink.shade100,
      'icon': Icons.opacity,
      'name': 'Calpol 500mg Tablet',
      'detail': 'Before Breakfast  Day 01',
      'status': 'Taken',
      'statusColor': Colors.green,
      'statusIcon': Icons.notifications_active,
    },
    {
      'time': 'Morning 08:00 am',
      'color': Colors.blue.shade100,
      'icon': Icons.local_pharmacy,
      'name': 'Calpol 500mg Tablet',
      'detail': 'Before Breakfast  Day 27',
      'status': 'Missed',
      'statusColor': Colors.red,
      'statusIcon': Icons.notifications_off,
    },
    {
      'time': 'Afternoon 02:00 pm',
      'color': Colors.purple.shade100,
      'icon': Icons.opacity,
      'name': 'Calpol 500mg Tablet',
      'detail': 'After Food  Day 01',
      'status': 'Snoozed',
      'statusColor': Colors.orange,
      'statusIcon': Icons.snooze,
    },
  ];

// Check if the current date is today
  bool isToday() {
    final now = DateTime.now();
    return now.year == currentDate.year && now.month == currentDate.month && now.day == currentDate.day;
  }


  // Function to get the formatted date string for a given offset
  String getFormattedDateCenter(int offset) {
    DateTime date = currentDate.add(Duration(days: offset));
    return DateFormat('EEEE, MMM d').format(date); // Example: Mon, Sep 4
  }
  String getFormattedDate(int offset) {
    DateTime date = currentDate.add(Duration(days: offset));
    return DateFormat('EEE').format(date); // Example: Mon, Sep 4
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: 20,

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi Atharva!",style: AppColors.commonTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontSize: 18,
                    ),

                      ),

                    Text("5 Medicines Left",style: AppColors.commonTextStyle.copyWith(
                      color: AppColors.black,fontWeight: FontWeight.w400,
                      fontSize: 16
                    ),

                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {

                    }, icon: Icon(Icons.shopping_bag,size: 24,color: AppColors.primaryColor,))

                    ,
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          navigateWithSlideTransition(context,ProfilePage(),durationInMillis: 700);
                         // Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(Icons.account_circle, size: 30, color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Previous Day (faded out)
                SizedBox(
                  width: 40,
                  child: Text(
                    getFormattedDate(-1),
                    style:  AppColors.commonTextStyle.copyWith(
                      fontSize: 16,
                      color:AppColors.textColor,

                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Left Arrow Button
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
                  onPressed: () {
                    updateDate(-1); // Show previous day
                  },
                ),
                // Displaying the dates with previous and next day
                Container(
                  //width: 180,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColors.greenColor,
                  ),
                  child: Center(
                    child: Text(
                      getFormattedDateCenter(0),
                      style:  AppColors.commonTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.backgroundColor,
                      ),
                    ),
                  ),
                ),
                // Right Arrow Button
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor),
                  onPressed: () {
                    updateDate(1); // Show next day
                  },
                ),
                const SizedBox(width: 8),
                // Next Day (faded out)
                SizedBox(
                  width: 40,
                  child: Text(
                    getFormattedDate(1),
                    style:  AppColors.commonTextStyle.copyWith(
                      fontSize: 16,
                      color:AppColors.textColor,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: isToday()
                  ? SingleChildScrollView(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: todayMedicines.map((medicine) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          medicine['time'],
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 10),
                        MedicineCard(
                          color: medicine['color'],
                          icon: medicine['icon'],
                          name: medicine['name'],
                          detail: medicine['detail'],
                          status: medicine['status'],
                          statusColor: medicine['statusColor'],
                          statusIcon: medicine['statusIcon'],
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  }).toList(),
                ),
              )
                  : Center(
                child: Image.asset(
                  'assets/images/nodataimage.png', // Add your logo in assets folder
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



