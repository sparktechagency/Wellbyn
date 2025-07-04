class Medication {
  final String name;
  final String dosage;
  final String frequency;
  // Or remove const if you have mutable fields
  Medication({
    required this.name,
    required this.dosage,
    required this.frequency,
  });
}