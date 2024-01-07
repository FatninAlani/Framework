import 'package:flutter/material.dart';
import 'package:mert_app/main.dart';
import 'package:mert_app/mainPage.dart';

class GlobalData {
  static List<MeritScreen> meritScreenList = [];
  static int totalMerit = 0;
}

/*class MeritData {
  String programName;
  String selectedLevel;
  int meritMark;

  MeritData({
    required this.programName,
    required this.selectedLevel,
    required this.meritMark,
  });
}*/

void main() {
  runApp(MyApp());
}

class MeritScreen extends StatefulWidget {
  final String programName;
  final String selectedLevel;
  final int meritMark;

  const MeritScreen({
    Key? key,
    required this.programName,
    required this.selectedLevel,
    required this.meritMark,
  }) : super(key: key);

  static void resetMeritScreenList() {
    GlobalData.meritScreenList.clear();
  }

  @override
  _MeritScreenState createState() => _MeritScreenState();
}

class _MeritScreenState extends State<MeritScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int totalMerit = 0;
  List<DataRow> dataRows = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Merit Star'),
        centerTitle: true,
        backgroundColor: Color(0xFF0F6BAE),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.home),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.blueAccent),
                  dividerThickness: 2.0,
                  columns: [
                    DataColumn(
                      label: Container(
                        width: 120,
                        child: Text('Program Name'),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        width: 120,
                        child: Text('Merit Mark'),
                      ),
                    )
                  ],
                  rows: GlobalData.meritScreenList.map((MeritScreen data) {
                    return DataRow(cells: [
                      DataCell(Container(
                        child: Text(
                          data.programName,
                          textAlign: TextAlign.center,
                        ),
                      )),
                      DataCell(Container(
                        child: Text(
                          data.meritMark.toString(),
                          textAlign: TextAlign.center,
                        ),
                      )),
                    ]);
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Merit: ${GlobalData.totalMerit}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Total Star: ${getStarCount(GlobalData.totalMerit)} Star',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    totalMerit = calculateTotalMerit();
    GlobalData.totalMerit = totalMerit;
  }

  @override
  void didUpdateWidget(covariant MeritScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    totalMerit = calculateTotalMerit();
    GlobalData.totalMerit = totalMerit;
  }

  int calculateTotalMerit() {
    return GlobalData.meritScreenList.fold<int>(
      0,
      (previousValue, element) => previousValue + element.meritMark,
    );
  }

  int getStarCount(int totalMerit) {
    if (totalMerit >= 1000) {
      return 5;
    } else if (totalMerit >= 800) {
      return 4;
    } else if (totalMerit >= 600) {
      return 3;
    } else if (totalMerit >= 400) {
      return 2;
    } else if (totalMerit >= 200) {
      return 1;
    } else {
      return 0;
    }
  }
}
