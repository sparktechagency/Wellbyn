import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';


class ExistingConditionsPage extends StatefulWidget {
  @override
  _ExistingConditionsPageState createState() => _ExistingConditionsPageState();
}

class _ExistingConditionsPageState extends State<ExistingConditionsPage> {
  Map<String, bool> conditions = {
    'Diabetes': false,
    'Hypertension': false,
    'Anxiety': false,
    'Depression': false,
    'Asthma': false,
  };

  void addCondition(String condition) {
    setState(() {
      conditions[condition] = false;
    });
  }

  void showAddDialog() {
    String newCondition = '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Condition"),
        content: TextField(
          onChanged: (value) {
            newCondition = value;
          },
          decoration: InputDecoration(hintText: "Enter condition"),
        ),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text("Add"),
            onPressed: () {
              if (newCondition.trim().isNotEmpty) {
                addCondition(newCondition.trim());
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
           color: Appcolors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Existing Conditions", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.grey),
                    onPressed: showAddDialog,
                  ),
                ],
              ),
              ...conditions.entries.map((entry) {
                return CheckboxListTile(
                  title: Text(entry.key),
                  checkColor:  Appcolors.disabled,
                  value: entry.value,
                  fillColor: MaterialStateProperty.all(Appcolors.action),
                  onChanged: (bool? val) {
                    setState(() {
                      conditions[entry.key] = val ?? false;
                    });
                  },
                );
              }).toList()
            ]),
          ),
        ),
    );
  }
}