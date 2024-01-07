import 'package:flutter/material.dart';
import 'package:mert_app/merit.dart';
import 'package:mert_app/program.dart';

class MainPage extends StatelessWidget {
  const MainPage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('U-MERIT'),
          centerTitle: true,
          backgroundColor: Color(0xFF0F6BAE),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF248BD6),
                ),
                child: Center(
                  child: Text(
                    'U-MERIT MENU',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Program Merit'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProgramScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Merit Star'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MeritScreen(
                        programName: '',
                        selectedLevel: '',
                        meritMark: 0,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            // Background Image
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'images/pic3.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // Program Merit Section
            Positioned(
              top: 160,
              left: 20,
              right: 20,
              child: Container(
                width: 290,
                height: 180,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset('images/Pro.png', height: 80),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              backgroundColor: Color(0xFF0F6BAE)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProgramScreen(),
                              ),
                            );
                          },
                          child: Text('Program Merit'),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Merit Star Section
            Positioned(
              top: 360,
              left: 20,
              right: 20,
              child: Container(
                width: 290,
                height: 180,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset('images/merit.png', height: 80),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              backgroundColor: Color(0xFF0F6BAE)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MeritScreen(
                                  programName: '',
                                  selectedLevel: '',
                                  meritMark: 0,
                                ),
                              ),
                            );
                          },
                          child: Text('  Merit Star  '),
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
    );
  }
}
