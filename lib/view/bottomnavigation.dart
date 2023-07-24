import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {




  @override
  Widget build(BuildContext context) {
    return


       BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:Colors.black, // Background color (golden yellow).

          iconSize: 30,
          elevation: 0,
       selectedItemColor: Color.fromARGB(255, 168, 155, 35), // Color of the selected icon and label.
          unselectedItemColor: Color.fromARGB(255, 168, 155, 35), // Color of the unselected icons and labels.
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: '',
            ),
          ],

       );
  }
}
