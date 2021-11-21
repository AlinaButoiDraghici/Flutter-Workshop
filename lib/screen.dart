import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_first_flutter_app/otherscreen.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  bool _isPressed = false;
  String _buttonText = "Press me";
  bool _petPressed = false;
  String _imagePath = 'assets/cat.jpg';
  String _txt = 'Hello word';

  void pushNewPage(screen) {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        leading: const Icon(Icons.face),
        title: const Text('My first flutter app!'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              height: 100,
              color: Colors.green[100],
              child: Center(
                child: Text(
                  _txt,
                  style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_isPressed) {
                        _buttonText = "Auch!";
                      } else {
                        _buttonText = "Press me!";
                      }
                      _isPressed = !_isPressed;
                    });
                  },
                  child: Text(
                    _buttonText,
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                )),
            Container(
              height: 200,
              width: 200,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      if (_petPressed) {
                        _imagePath = 'assets/dog.jpg';
                      } else {
                        _imagePath = 'assets/cat.jpg';
                      }
                      _petPressed = !_petPressed;
                    });
                  },
                  child: Image.asset(_imagePath)),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[100],
        child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 250,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText("STIRI DE ULTIMA ORA: SOC! SOC! SOC!",
                          textStyle: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                Container(
                    width: 50,
                    child: ElevatedButton(
                      child: const Icon(Icons.arrow_forward_ios),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        pushNewPage(OtherScreen());
                      },
                    ))
              ],
            )),
      ),
    );
  }
}
