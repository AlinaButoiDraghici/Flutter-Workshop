import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/controllers/providers.dart';
import 'package:my_first_flutter_app/screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String myText = ref.watch(textProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyScreen(),
    );
  }
}
