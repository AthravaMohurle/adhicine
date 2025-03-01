import 'package:adhicine/utils/AppColors.dart';
import 'package:flutter/material.dart';

import '../widgets/CustomAppBar.dart';

class AddMedicinesPage extends StatefulWidget {
  @override
  _AddMedicinesPageState createState() => _AddMedicinesPageState();
}

class _AddMedicinesPageState extends State<AddMedicinesPage> {
  int selectedCompartment = 0;
  int selectedColor = 0;
  int selectedType = 0;
  int quantity = 1;
  double totalCount = 1;
  String selectedFrequency = 'Everyday';
  String timesPerDay = 'Three Time';
  int selectedFoodTime = 0;

  final List<Color> colorOptions = [
    Colors.pink.shade100,
    Colors.purple.shade100,
    Colors.red.shade100,
    Colors.green.shade100,
    Colors.orange.shade100 ,
     Colors.blue.shade100,
  ];

  final List<String> frequencies = [
    'Everyday',
    'Alternate Days',
    'Once a Week',
    'Custom'
  ];

  final List<String> times = [
    'One Time',
    'Two Times',
    'Three Time',
    'Four Time'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: const CustomAppBar(title: "Add Medicines"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.mic),
                hintText: 'Search Medicine Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            Text('Compartment'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCompartment = index;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                color: selectedCompartment == index
                ?  AppColors.primaryColor
                    : Colors.grey[200] ?? Colors.grey,
                    )
                ),

                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          color:  Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Text('Colour'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(colorOptions.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = index;
                    });
                  },
                  child:Container(
                    height: 35,
                    width:35,
                    decoration: BoxDecoration(
                      color: colorOptions[index],
                      shape: BoxShape.circle, // Makes the container circular
                      border: Border.all(
                        color: selectedColor == index
                            ?  AppColors.primaryColor
                            : Colors.grey[200] ?? Colors.grey,
                      ),
                    ),
                  ),

                );
              }),
            ),
            SizedBox(height: 20),
            Text('Type'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, (index) {
                final icons = [
                  Icons.tablet,
                  Icons.medical_information_outlined,
                  Icons.icecream_rounded,
               //   Icons.liquor
                ];
                final labels = [
                  'Tablet',
                  'Capsule',
                  'Cream',
                 // 'Liquid'
                ];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedType = index;
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: selectedType == index
                            ?  AppColors.primaryColor
                            : Colors.grey[200],
                        child: Icon(
                          icons[index],
                          color: selectedType == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      Text(labels[index]),
                    ],
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Text('Quantity'),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: 'Take 1/2 Pill',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:  AppColors.primaryColor), // Border color when focused
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey), // Border color when not focused
                      ),
                    ),
                  ),
                ),
SizedBox(width: 10,),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                        border: Border.all(
                          color:  AppColors.primaryColor, // Border color
                          width: 1,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.remove, color: AppColors.primaryColor), // Icon color
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 8), // Space between the widgets
                    Text(
                      quantity.toString().padLeft(2, '0'),
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 8), // Space between the widgets
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor, // Background color
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                        border: Border.all(
                          color:  AppColors.primaryColor, // Border color
                          width: 1,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add, color: Colors.white), // Icon color
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ),
                  ],
                ),

              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Count'),
                Text(totalCount.toInt().toString()),
              ],
            ),
            Slider(

              activeColor: AppColors.primaryColor,
              value: totalCount,
              min: 1,
              max: 100,
              divisions: 100,
              label: totalCount.toInt().toString(),
              onChanged: (value) {
                setState(() {
                  totalCount = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Set Date'),
            Row(
              spacing: 10,

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                  //width: 120,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: AppColors.textColor)),
                  
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Today',style: TextStyle(color: AppColors.black),),
                        Icon(Icons.arrow_forward_ios_outlined,size: 14,)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                   // width: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: AppColors.textColor)),
                  
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('End Date',style: TextStyle(color: AppColors.black),),
                        Icon(Icons.arrow_forward_ios_outlined,size: 14,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('Frequency of Days'),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 1, // Border width
                ),
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              padding: EdgeInsets.symmetric(horizontal: 8), // Space inside the border
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedFrequency,
                underline: SizedBox(), // Removes the default underline
                items: frequencies.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedFrequency = newValue!;
                  });
                },
              ),
            ),

            SizedBox(height: 10),
            Text('How many times a Day'),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 1, // Border width
                ),
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: DropdownButton<String>(
                underline: SizedBox(),
                isExpanded: true,
                value: timesPerDay,
                items: times.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    timesPerDay = newValue!;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Before Food', 'After Food', 'Before Sleep']
                  .asMap()
                  .entries
                  .map((entry) {
                int index = entry.key;
                String label = entry.value;
                return ChoiceChip(

                  color: WidgetStatePropertyAll(Colors.indigoAccent.shade100),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  label: Text(label,style: TextStyle(color: Colors.white),),
                  selected: selectedFoodTime == index,
                  onSelected: (selected) {
                    setState(() {
                      selectedFoodTime = index;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(

                onPressed: () {},
                child: Text('Add',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.indigoAccent.shade100 ,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
