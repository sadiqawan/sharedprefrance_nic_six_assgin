import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   bool status = false;

  @override
  void initState() {
    //("INIT Function Called");
    readStatus();
    super.initState();
  }

  readStatus() async {
    final pref = await SharedPreferences.getInstance();
    status = await pref.getBool('status') ?? false;
    setState(() {});
  }

  setStatus(bool value) async {
    final pref = await SharedPreferences.getInstance();

    status = await pref.setBool('status', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Shared_pref',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lightbulb,
              size: 200,
              color: status ? Colors.amberAccent : Colors.black,
            ),
            const SizedBox(
              height: 30,
            ),
            Switch(
                value: status,
                onChanged: (value) {
                  setState(() {
                    status = value;
                  });
                })
          ],
        ),
      ),
    );
  }
}
