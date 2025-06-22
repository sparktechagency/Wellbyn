import 'package:flutter/material.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/views/screen/profile/base/existioncondition.dart';

void main() {
  runApp(MaterialApp(home: MedicalInfoPage()));
}

class MedicalInfoPage extends StatefulWidget {
  @override
  _MedicalInfoPageState createState() => _MedicalInfoPageState();
}

class _MedicalInfoPageState extends State<MedicalInfoPage> {
  List<Map<String, String>> allergies = [
    {"name": "Penicillin", "dosage": "Moderate"},
    {"name": "Penicillin", "dosage": "Moderate"},
  ];

  List<Map<String, String>> medications = [
    {"name": "Lisinopril", "frequency": "Once daily"},
    {"name": "Metformin", "frequency": "Twice daily"},
  ];

  void deleteAllergy(int index) {
    setState(() {
      allergies.removeAt(index);
    });
  }

  void deleteMedication(int index) {
    setState(() {
      medications.removeAt(index);
    });
  }

  Widget buildCard(String title, List<Map<String, String>> items, List<String> columns, Function(int) onDelete) {
    return Card(
      color: Appcolors.primary,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Icon(Icons.add, color: Colors.blue),
            ],
          ),
          Divider(),
          ...items.asMap().entries.map((entry) {
            int idx = entry.key;
            var item = entry.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(item[columns[0]] ?? "")),
                Expanded(child: Text(item[columns[1]] ?? "")),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.grey),
                  onPressed: () => onDelete(idx),
                )
              ],
            );
          }).toList(),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medical Infor", style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(children: [
                Icon(Icons.medical_services_outlined),
                SizedBox(width: 8),
                Expanded(child: Text("Hi! Please share your personal info...")),
              ]),
            ),
            buildCard("Allergies", allergies, ["name", "dosage"], deleteAllergy),
            buildCard("Current Medications", medications, ["name", "frequency"], deleteMedication),
            ExistingConditionsPage(),
          ],
        ),
      ),
    );
  }
}
