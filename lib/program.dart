import 'package:flutter/material.dart';
import 'package:mert_app/main.dart';
import 'package:mert_app/mainPage.dart';
import 'package:mert_app/merit.dart';

void main() {
  runApp(MyApp());
}

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({Key? key}) : super(key: key);

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  final _formKey = GlobalKey<FormState>();
  final _programNameController = TextEditingController();
  String _selectedLevel = 'Level';

  List<String> _levelOptions = [
    'Level',
    'Club',
    'UMT',
    'International',
    'WorldWide'
  ];

  Map<String, int> _meritMarkMap = {
    'Club': 5,
    'UMT': 10,
    'International': 30,
    'WorldWide': 50,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program Merit'),
        centerTitle: true,
        backgroundColor: Color(0xFF0F6BAE),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainPage()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.home),
            ),
          ),
        ],
      ),

      //body
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              //textfield one
              TextFormField(
                controller: _programNameController,
                decoration: const InputDecoration(
                  labelText: 'Program Name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the program name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              // dropdown button two
              DropdownButtonFormField<String>(
                value: _selectedLevel,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLevel = newValue!;
                  });
                },
                items:
                    _levelOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 25,
              ),
              //button submit
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0F6BAE),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    MeritScreen newMeritScreen = MeritScreen(
                      programName: _programNameController.text,
                      selectedLevel: _selectedLevel,
                      meritMark: _meritMarkMap[_selectedLevel] ?? 0,
                    );

                    GlobalData.meritScreenList.add(newMeritScreen);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MeritScreen(
                          programName: newMeritScreen.programName,
                          selectedLevel: newMeritScreen.selectedLevel,
                          meritMark: newMeritScreen.meritMark,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
