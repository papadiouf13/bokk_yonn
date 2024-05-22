import 'package:bokk_yonn/app/commons/constantes/colors/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/ride_controller.dart';

class RideView extends GetView<RideController> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),

        centerTitle:true ,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height:30),
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.getDaysOfWeek().length,
              itemBuilder: (context, index) {
                DateTime date = controller.getDaysOfWeek()[index];
                bool isSelected = controller.selectedDate.value.day == date.day &&
                    controller.selectedDate.value.month == date.month &&
                    controller.selectedDate.value.year == date.year;
                return GestureDetector(
                  onTap: () => controller.selectedDate.value = date,
                  child: Container(
                    width: 60,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: isSelected ? mainColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(DateFormat('EEE').format(date), style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
                        Text(date.day.toString(), style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.directions_car, size: 30),
                          SizedBox(height: 10),
                          Obx(() => Column(
                            children: [
                              Text("Total Rides",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16)
                              ),
                              Text(controller.totalRides.string,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 22)
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.attach_money, size: 30),
                          SizedBox(height: 10),
                          Obx(() => Column(
                            children: [
                              Text("Total Cost",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16)
                              ),
                              Text(controller.totalCost.string,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 22)
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.rideHistory.length,
              itemBuilder: (context, index) {
                var ride = controller.rideHistory[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(ride.driverImage),
                          radius: 25,
                        ),
                        title: Text(ride.driverName),
                        subtitle: Text('${ride.distance} km'),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('₹${ride.fare}', style: TextStyle(fontSize: 16)),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star, color: Colors.yellow, size: 16),
                                Text('${ride.rating}', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                              icon: Icon(Icons.phone, color: Colors.blue),
                              label: Text('Call Driver', style: TextStyle(color: Colors.blue)),
                              onPressed: () {
                                // Handle call driver
                              },
                            ),
                            TextButton.icon(
                              icon: Icon(Icons.info, color: Colors.blue),
                              label: Text('Ride Details', style: TextStyle(color: Colors.blue)),
                              onPressed: () {
                                // Handle ride details
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}