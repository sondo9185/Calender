import 'package:calender/tapbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();
  
  runApp(
    const MaterialApp(
          home: TapBar()
    )
    );
}
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TabBar,
//     );
//   }
// }