import 'package:flutter/material.dart';

// Stateful widget for the bottom sheet to manage radio and checkbox states
class CustomBottomSheet extends StatefulWidget {
  final dynamic index;

  const CustomBottomSheet({super.key, this.index});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int? _selectedRadio = 1;
  bool _isChecked = false;
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    var index = widget.index;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
          left: 20.0,
          right: 20.0,
          top: 20.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Make the column take minimum space
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Label
            const Text(
              'This is a Label',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Edit Text
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Edit Text Placeholder',
                hintText: 'Enter your text here',
              ),
            ),
            const SizedBox(height: 20),

            // Radio Buttons
            const Text(
              'Select an Option:',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: <Widget>[
                Radio<int>(
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedRadio = value;
                    });
                  },
                ),
                const Text('Option 1'),
              ],
            ),
            Row(
              children: <Widget>[
                Radio<int>(
                  value: 2,
                  groupValue: _selectedRadio,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedRadio = value;
                    });
                  },
                ),
                const Text('Option 2'),
              ],
            ),
            const SizedBox(height: 20),

            // Checkbox
            Row(
              children: <Widget>[
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                const Text('This is a Checkbox'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Switch(
                  value: _isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                ),
                const Text('This is a Switch'),
              ],
            ),
            const SizedBox(height: 20),
            // Primary Button
            ElevatedButton(
              onPressed: () {
                // Handle primary button tap
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  // Allows the sheet to take full height
                  builder: (BuildContext context) {
                    return const CustomBottomSheet(index : 1);
                  },
                );
              },
              child: const Text('Primary Button'),
            ),
            const SizedBox(height: 20),

            // Error Button
            ElevatedButton(
              onPressed: () {
                // Handle error button tap
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Error Button Tapped!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Background color for error
                foregroundColor: Colors.white, // Text color
              ),
              child: const Text('Error Button'),
            ),
            const SizedBox(height: 20),

            // Loading Indication
            const Center(
              child: CircularProgressIndicator(),
            ),
            const SizedBox(height: 20),

            // Full Width Button
            SizedBox(
              width: double.infinity, // Make the button take full width
              child: ElevatedButton(
                onPressed: () {
                  // Handle full width button tap
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Full Width Button Tapped!')),
                  );
                },
                child: const Text('Full Width Button'),
              ),
            ),
            const SizedBox(height: 20), // Add some space at the bottom
          ],
        ),
      ),
    );
  }
}
