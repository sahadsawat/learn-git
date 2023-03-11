import 'package:flutter/material.dart';
import 'package:login_app/screens/login_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: Text('ล็อกอินฟอร์ม101'),
            shadowColor: Colors.amber,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                LoginScreen(),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          )),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'widgets/DataTableDemo.dart';

// void main() {
//   runApp(
//     HomeApp(),
//   );
// }

// class HomeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DataTableDemo(),
//     );
//   }
// }
