import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter_app/controllers/providers.dart';

class OtherScreen extends ConsumerStatefulWidget {
  @override
  _OtherScreenState createState() => _OtherScreenState();
}

class _OtherScreenState extends ConsumerState<OtherScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(textProvider);
  }

  void popPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    String magicText = ref.watch(textProvider);
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            height: 100,
            color: Colors.green[100],
            child: Center(
              child: Text(
                magicText,
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
                  ref.listen(textProvider, (previous, next) { })
                },
                child: Text(
                  'Change text',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              )),
        ],
      )),
    );
  }
}
