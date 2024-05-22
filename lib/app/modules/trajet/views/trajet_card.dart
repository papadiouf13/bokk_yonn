import 'package:bokk_yonn/app/commons/constantes/colors/app_colors.dart';
import 'package:bokk_yonn/app/data/models/trip.dart';
import 'package:flutter/material.dart';

class TrajetCard extends StatelessWidget {
  final Trip trip;

  const TrajetCard({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondGreyColor,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset('assets/icones/car.png', height: 50),
        title: Text(trip.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text(trip.date),
              ],
            ),
            Row(
              children: [
                Icon(Icons.person, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text('${trip.passengers} Passengers'),
              ],
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}