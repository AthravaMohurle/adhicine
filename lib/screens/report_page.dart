import 'package:adhicine/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:multicircularprogressindicator/models/progress_model.dart';
import 'package:multicircularprogressindicator/multicircularprogressindicator.dart';

import '../widgets/MedicineCard.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0; // Keep track of the selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: 20,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Report",style: AppColors.commonTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
            fontSize: 26,
          ),),

              Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: AppColors.backgroundColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Today's Report",style: AppColors.commonTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontSize: 18,
                    ),),
                    SizedBox(height: 14,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Column(
                        children: [
                          Text("5",style: AppColors.commonTextStyle.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.primaryColor,
                            fontSize: 22,
                          ),),
                          Text("Total",style: AppColors.commonTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor,
                            fontSize: 16,
                          ),),
                        ],
                      ),Column(
                        children: [
                          Text("3",style: AppColors.commonTextStyle.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.primaryColor,
                            fontSize: 22,
                          ),),
                          Text("Taken",style: AppColors.commonTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor,
                            fontSize: 16,
                          ),),
                        ],
                      ),Column(
                        children: [
                          Text("1",style: AppColors.commonTextStyle.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.primaryColor,
                            fontSize: 22,
                          ),),
                          Text("Missed",style: AppColors.commonTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor,
                            fontSize: 16,
                          ),),
                        ],
                      ),Column(
                        children: [
                          Text("1",style: AppColors.commonTextStyle.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.primaryColor,
                            fontSize: 22,
                          ),),
                          Text("Snoozed",style: AppColors.commonTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor,
                            fontSize: 16,
                          ),),
                        ],
                      ),
                    ],),


                    ],
                  ),
                ),
              ),
              Card(
                  elevation: 2,
                  child
                      : Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.backgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Check Dashboard",
                                style: AppColors.commonTextStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Here you find everything related \nto your active and past medicines.",
                                style: AppColors.commonTextStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: MultiCircularProgressWidget(
                            listProgress: [
                              ProgressModel(
                                progressValue: 0.3,
                                color: Color.fromARGB(255, 0, 159, 66),
                              ),
                              ProgressModel(
                                progressValue: 0.3,
                                color: Color.fromRGBO(255, 102, 52, 1.0),
                              ),
                              ProgressModel(
                                progressValue: 0.25,
                                color: Color.fromRGBO(0, 204, 255, 1.0),
                              ),
                              ProgressModel(progressValue: 0.15, color: Colors.purple),
                            ],
                            radius: 40,
                            topText: "",
                            bottomText: "",
                          // circularStrokeCap: ,
                            progressStyle: ProgressStyle.decremented,
                            isShadowed: true,
                          ),
                        ),


                      ],
                    ),
                  )

              )
        ,  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Check History",
                    style: AppColors.commonTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: selectedIndex == index
                              ? AppColors.primaryColor
                              : AppColors.backgroundColor,
                          child: Text(
                            "${index + 1}",
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : AppColors.textColor,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Morning 08:00 am",
                    style: AppColors.commonTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontSize: 18,
                    ),
                  ),
                  MedicineCard(
                    name: "Calpol 500mg Tablet",
                    detail: "Before Breakfast • Day 01",
                    status: "Taken",
                    statusColor: Colors.green,
                    icon: Icons.check_circle,
                    color: Colors.blue.shade100,
                    statusIcon: Icons.notifications_active,
                  ),
                  MedicineCard(
                    name: "Calpol 500mg Tablet",
                    detail: "Before Breakfast • Day 27",
                    status: "Missed",
                    statusColor: Colors.red,
                    icon: Icons.error,
                    color: Colors.blue.shade100,
                    statusIcon: Icons.notifications_active,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Afternoon 02:00 pm",
                    style: AppColors.commonTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontSize: 18,
                    ),
                  ),
                  MedicineCard(
                    name: "Calpol 500mg Tablet",
                    detail: "After Food • Day 01",
                    status: "Snoozed",
                    statusColor: Colors.orange,
                    icon: Icons.alarm,
                    color: Colors.blue.shade100,
                    statusIcon: Icons.notifications_active,
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}



