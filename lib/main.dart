import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _placeOfBirthController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _religionController = TextEditingController();
  String _gender = 'Laki-laki';
  String _submitMessage = '';

  void _handleSubmit() {
    
    print('Terima kasih! Data Anda sukses terkirim.');

    
    setState(() {
      _submitMessage = 'Terima kasih! Data Anda sukses terkirim.';
    });

    // Clear text fields
    _nameController.clear();
    _nimController.clear();
    _placeOfBirthController.clear();
    _dateOfBirthController.clear();
    _religionController.clear();

    // Reset gender selection
    setState(() {
      _gender = 'Laki-laki';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _nimController,
              decoration: InputDecoration(labelText: 'NIM'),
            ),
            TextField(
              controller: _placeOfBirthController,
              decoration: InputDecoration(labelText: 'Tempat Lahir'),
            ),
            TextField(
              controller: _dateOfBirthController,
              decoration: InputDecoration(labelText: 'Tanggal Lahir'),
            ),
            TextField(
              controller: _religionController,
              decoration: InputDecoration(labelText: 'Agama'),
            ),
            Row(
              children: [
                Text('Jenis Kelamin:'),
                SizedBox(width: 16),
                DropdownButton<String>(
                  value: _gender,
                  onChanged: (String? newValue) {
                    setState(() {
                      _gender = newValue!;
                    });
                  },
                  items: <String>['Laki-laki', 'Wanita'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _handleSubmit,
              child: Text('Submit'),
            ),
            SizedBox(height: 16),
            Text(
              _submitMessage,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
