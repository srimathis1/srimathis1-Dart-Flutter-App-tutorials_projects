import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// ROOT WIDGET (STATELESS)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TextField Sample',
      home: const InputScreen(),
    );
  }
}

/// STATEFUL WIDGET (because data changes)
class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  // Controller to read TextField input
  final TextEditingController nameController = TextEditingController();

  String displayText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// TextField for user input
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            /// Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  displayText = nameController.text;
                });
              },
              child: const Text('Show Name'),
            ),

            const SizedBox(height: 20),

            /// Display input
            Text(
              displayText.isEmpty
                  ? 'Your name will appear here'
                  : 'Hello, $displayText',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
