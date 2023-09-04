import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Obtain shared preferences.
  SharedPreferences? prefs;

  String sValue = "";
  bool? bValue;
  int? iValue;
  double? dValue;
  List<String> lValue = [""];
  setInstance() async {
    prefs = await SharedPreferences.getInstance();
  }

  setData() {
    prefs!.setString('s_value', "JEET RABADIYA");
    prefs!.setBool('b_value', false);
    prefs!.setInt('i_value', 12);
    prefs!.setDouble('d_value', 0222521);
    prefs!.setStringList(
      'textList',
      ["hiii", "Hello", "Thank you"],
    );
  }

  getData() {
    sValue = prefs!.getString('s_value')!;
    bValue = prefs!.getBool('b_value')!;
    iValue = prefs!.getInt('i_value')!;
    dValue = prefs!.getDouble('d_value')!;
    lValue = prefs!.getStringList('textList')!;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    setInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // double screenHeight = size.height;
    // double screenWidth = size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "String value : $sValue",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Bool value : $bValue",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "int value : $iValue",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "double value : $dValue",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "List value : $lValue",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: setData,
              child: const Text("Send Data"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: getData,
              child: const Text("Get Data"),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
