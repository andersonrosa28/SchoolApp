import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management/calendar.dart';
import 'package:school_management/home.dart';
import 'package:school_management/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(statusBarColor: Colors.transparent));

        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'GoSchool UI',
            theme: ThemeData(
                primaryColor: Color(0xFF202328),
                accentColor: Color(0xFF63CF93),
                backgroundColor: Color(0xFF12171D),
                visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: WelcomeScreen(),
        );
    }
}


class SchoolManagement extends StatefulWidget {
  @override
  _SchoolManagementState createState() => _SchoolManagementState();
}

class _SchoolManagementState extends State<SchoolManagement> {
  int _selectedItemIndex = 0;
  final List pages = [
    HomePage(),
    null,
    null,
    CalendarPage(),
    null,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Theme.of(context).backgroundColor,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectedItemIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
                setState(() {
                    _selectedItemIndex = index;
                });
            },
            items: [
                BottomNavigationBarItem(
                    title: Text(""),
                    icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                    title: Text(""),
                    icon: Icon(Icons.insert_chart),
                ),
                BottomNavigationBarItem(
                    title: Text(""),
                    icon: Icon(Icons.done),
                ),
                BottomNavigationBarItem(
                    title: Text(""),
                    icon: Icon(Icons.calendar_today),
                ),
                BottomNavigationBarItem(
                    title: Text(""),
                    icon: Icon(Icons.chat_bubble),
                ),
            ],
        ),
        body: pages[_selectedItemIndex]
    );
  }
}
