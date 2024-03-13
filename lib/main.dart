import 'package:ass3/bookedinformation.dart';
import 'package:ass3/customwidget/HaircutCardlist.dart';
import 'package:ass3/customwidget/TimeSlotCard.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Selection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DateSelectionPage(),
    );
  }
}

class DateSelectionPage extends StatefulWidget {
  @override
  _DateSelectionPageState createState() => _DateSelectionPageState();
}

class _DateSelectionPageState extends State<DateSelectionPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String? selectedType;

  final List<Map<String, dynamic>> haircuts = [
    {
      "type": "Classic Men's Cut",
      "image_asset": "assets/images/img_group_44.png",
      "price": "\$20"
    },
    {
      "type": "Pixie Cut",
      "image_asset": "assets/images/img_group_44.png",
      "price": "\$30"
    },
    {"type": "Bob Cut", "image_asset": "assets/bob_cut.jpg", "price": "\$25"},
    {
      "type": "Layered Cut",
      "image_asset": "assets/images/img_group_44.png",
      "price": "\$35"
    },
    {
      "type": "Fade Haircut",
      "image_asset": "assets/images/img_group_44.png",
      "price": "\$25"
    }
  ];

  void selectType(String type) {
    setState(() {
      selectedType = type;
    });
  }

  String? selectedTimeSlot;

  final List<Map<String, dynamic>> timeSlots = [
    {"time": "9:00 AM", "available": true},
    {"time": "10:00 AM", "available": false},
    {"time": "11:00 AM", "available": true},
    {"time": "12:00 PM", "available": false},
    {"time": "1:00 PM", "available": true},
    {"time": "2:00 PM", "available": true},
    {"time": "3:00 PM", "available": false},
    {"time": "4:00 PM", "available": true},
    {"time": "5:00 PM", "available": true},
    {"time": "6:00 PM", "available": false}
  ];

  void selectTimeSlot(String timeSlot) {
    final selectedSlot = timeSlots.firstWhere(
      (slot) => slot['time'] == timeSlot && slot['available'] == true,
      orElse: () => {'time': null},
    );
    if (selectedSlot['time'] != null) {
      //  state management here
      setState(() {
        selectedTimeSlot = timeSlot;
      });
    } else {
      // case unavailability here
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title:
                Text('Slot Unavailable', style: TextStyle(color: Colors.white)),
            content: Text(
                'This time slot is not available. Please choose another one.',
                style: TextStyle(color: Colors.white)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      );
    }
  }

  void _bookNow() {
    if (selectedType != null && selectedTimeSlot != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookingConfirmationPage(
            selectedDate: _selectedDay,
            selectedType: selectedType!,
            selectedTimeSlot: selectedTimeSlot!,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text('Selection Incomplete',
                style: TextStyle(color: Colors.white)),
            content: Text('Please select both type and time slot.',
                style: TextStyle(color: Colors.white)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                height: 300,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage("assets/images/saloon.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back, color: Colors.white),
                          SizedBox(
                            width: screenWidth * 0.05,
                          ),
                          Text(
                            'Book Appointment',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.05),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'The fade factory',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.location_on, color: Colors.white),
                                Text(
                                  'jago express center (2km)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star, color: Colors.white),
                                Text(
                                  '5.0 star',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 94, 91, 91),
                width: screenWidth,
                child: TableCalendar(
                  firstDay: DateTime(DateTime.now().year - 10,
                      DateTime.now().month, DateTime.now().day),
                  lastDay: DateTime.utc(
                      DateTime.now().year, DateTime.now().month + 1, 0),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  headerStyle: HeaderStyle(
                    titleTextStyle: TextStyle(color: Colors.white),
                    formatButtonVisible: false,
                    leftChevronIcon:
                        Icon(Icons.arrow_back, color: Colors.white),
                    rightChevronIcon:
                        Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.white),
                    weekendStyle: TextStyle(color: Colors.white),
                  ),
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(color: Colors.white),
                    weekendTextStyle: TextStyle(color: Colors.white),
                    selectedTextStyle: TextStyle(color: Colors.black),
                    todayTextStyle: TextStyle(color: Colors.white),
                    outsideTextStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: Text(
                      'Choose Service',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: haircuts.map((haircut) {
                    return GestureDetector(
                      onTap: () => selectType(haircut['type']),
                      child: HaircutCard(
                        type: haircut['type'],
                        imageAsset: haircut['image_asset'],
                        price: haircut['price'],
                        isSelected: selectedType == haircut['type'],
                      ),
                    );
                  }).toList(),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: Text(
                      'Available time',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Wrap(
                spacing: 2.0,
                runSpacing: 2.0,
                alignment: WrapAlignment.start,
                children: [
                  for (int i = 0; i < timeSlots.length; i++)
                    TimeSlotCard(
                      timeSlot: timeSlots[i]['time'],
                      isSelected: selectedTimeSlot == timeSlots[i]['time'],
                      available: timeSlots[i]['available'],
                      onTap: () {
                        if (timeSlots[i]['available']) {
                          selectTimeSlot(timeSlots[i]['time']);
                        }
                      },
                    ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: _bookNow,
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: screenWidth * 0.9,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenWidth * 0.03),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Book Now',
                              style: TextStyle(color: Colors.black)),
                          SizedBox(width: 8.0),
                          Icon(Icons.book, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
