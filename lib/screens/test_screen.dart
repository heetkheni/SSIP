import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class TestsScreen extends StatelessWidget {
  final List<Map<String, String>> medicalTests;

  TestsScreen(this.medicalTests);

  final List<Color> cardColors = [
    Colors.yellow.shade200,
    Colors.blue.shade200,
    Colors.green.shade200,
    Colors.pink.shade200,
    Colors.purple.shade200,
    Colors.orange.shade200,
  ];

  // Map test names to corresponding icons
  // Map test names to corresponding icons
  final Map<String, IconData> testIcons = {
    'Complete Blood Count (CBC)': Icons.favorite,
    'Blood Glucose Test': Icons.local_hospital,
    'Urinalysis': Icons.opacity,
    'Urine Culture and Sensitivity (C&S)': Icons.local_hospital,
    'Sputum Culture': Icons.masks,
    'Acid-Fast Bacillus (AFB) Test': Icons.masks,
    'X-rays': Icons.favorite,
    'Computed Tomography (CT) Scan': Icons.scanner,
    'Magnetic Resonance Imaging (MRI)': Icons.scanner,
    'Ultrasound': Icons.waves,
    'Mammogram': Icons.local_hospital,
    'Bone Density Test (DEXA Scan)': Icons.local_hospital,
    'Electrocardiogram (ECG or EKG)': Icons.favorite,
    'Stress Test (Exercise Treadmill Test)': Icons.directions_run,
    'Echocardiogram': Icons.favorite,
    'Holter Monitor': Icons.monitor,
    'Upper Gastrointestinal (GI) Series': Icons.restaurant,
    'Colonoscopy': Icons.local_hospital,
    'Endoscopy': Icons.visibility,
    'Liver Biopsy': Icons.healing,
    'Pulmonary Function Test (PFT)': Icons.legend_toggle_sharp,
    'Bronchoscopy': Icons.visibility,
    'Arterial Blood Gas (ABG) Test': Icons.favorite,
    'DNA Testing': Icons.bloodtype,
    'Carrier Testing': Icons.local_hospital,
    'Genetic Counseling': Icons.family_restroom,
    'Human Immunodeficiency Virus (HIV) Test': Icons.favorite,
    'Tuberculosis (TB) Test': Icons.masks,
    'Hepatitis Panel': Icons.local_hospital,
    'Follicle-Stimulating Hormone (FSH)': Icons.female,
    'Thyroid-Stimulating Hormone (TSH)': Icons.healing,
    'Testosterone Levels': Icons.male,
    'Progesterone Levels': Icons.pregnant_woman,
    'Estradiol Levels': Icons.favorite_border,
    'Skin Prick Test': Icons.favorite,
    'Blood Allergy Test (IgE Test)': Icons.all_inclusive,
    'Pap Smear (Cervical Cancer Screening)': Icons.local_hospital,
    'Prostate-Specific Antigen (PSA) Test': Icons.favorite,
    'Electroencephalogram (EEG)': Icons.visibility,
    'Lumbar Puncture (Spinal Tap)': Icons.location_searching,
    'Metabolic Panel': Icons.favorite_border,
    'Glucose Tolerance Test (GTT)': Icons.favorite,
    'Antinuclear Antibody (ANA) Test': Icons.favorite,
    'Rheumatoid Factor (RF) Test': Icons.favorite,
    // Add more test names and icons here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tests'),
      ),
      body: ListView.builder(
        itemCount: medicalTests.length,
        itemBuilder: (context, index) {
          final testName = medicalTests[index]['name'];
          final testDescription = medicalTests[index]['description'];
          final testIcon = testIcons[testName];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: cardColors[index % cardColors.length],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (testIcon != null) Icon(testIcon, size: 24),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            testName!,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    ListTile(
                      leading: Icon(Icons.arrow_right),
                      title: Text(
                        testDescription!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      minLeadingWidth: 0,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
