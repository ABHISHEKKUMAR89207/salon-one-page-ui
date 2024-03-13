import 'package:flutter/material.dart';

class BookingConfirmationPage extends StatelessWidget {
  final DateTime selectedDate;
  final String selectedType;
  final String selectedTimeSlot;

  BookingConfirmationPage({
    required this.selectedDate,
    required this.selectedType,
    required this.selectedTimeSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Booking Confirmation'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Selected Date: ${selectedDate.toString()}',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Selected Type: $selectedType',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Selected Time Slot: $selectedTimeSlot',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
