import 'package:flutter/material.dart';

class TimeSlotCard extends StatelessWidget {
  final String timeSlot;
  final bool isSelected;
  final bool available;
  final VoidCallback onTap;

  TimeSlotCard({
    required this.timeSlot,
    required this.isSelected,
    required this.available,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 35,
          width: MediaQuery.of(context).size.width * 0.2, // Adjust width here
          decoration: BoxDecoration(
            color: available
                ? (isSelected ? Colors.white : Colors.transparent)
                : Colors.red, // Red color for unavailable slots
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          child: Center(
            child: Text(
              timeSlot,
              style: TextStyle(
                fontSize: 14.0,
                color: available
                    ? (isSelected ? Colors.black : Colors.white)
                    : Colors.white, // Text color
              ),
            ),
          ),
        ),
      ),
    );
  }
}
