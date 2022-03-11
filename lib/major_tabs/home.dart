import 'package:flutter/material.dart';
import 'package:ksb_app/constants/palette.dart';
import 'package:ksb_app/major_tabs/profile.dart';
import 'package:ksb_app/major_tabs/tasks_page.dart';
import 'package:ksb_app/routes/routes.dart';

class HomePage extends StatefulWidget {
  final bool isManager;
  const HomePage({Key? key, required this.isManager}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _navigate(value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        TasksPage(),
        ProfilePage(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorNavBackground,
        selectedItemColor: colorNavIconChecked,
        unselectedItemColor: colorNavIconUnchecked,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_rounded),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: "Profile",
          ),
        ],
        elevation: 20,
        currentIndex: _selectedIndex,
        onTap: (value) => {_navigate(value)},
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_task_rounded),
        onPressed: () {
          if (!widget.isManager) {
            Navigator.of(context).pushNamed(RouteManager.addTaskPopup);
          }
          else{
            Navigator.of(context).pushNamed(RouteManager.addTaskPage);
          }
        },
      ),
    );
  }
}
