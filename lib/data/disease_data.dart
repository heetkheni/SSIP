List<Map<String, dynamic>> communicableDiseases = [
  {
    'name': 'Influenza (Flu)',
    'symptoms': ['Fever', 'Cough', 'Body aches'],
    'preventions': ['Flu vaccine', 'Hand hygiene'],
    'medicines': ['Antiviral medications'],
    'precautions': ['Avoid close contact', 'Cover mouth and nose'],
  },
  {
    'name': 'Common Cold',
    'symptoms': ['Runny nose', 'Sneezing', 'Sore throat'],
    'preventions': ['Hand hygiene', 'Avoid close contact'],
    'medicines': ['Over-the-counter cold remedies'],
    'precautions': ['Stay hydrated', 'Rest'],
  },
  {
    'name': 'Tuberculosis (TB)',
    'symptoms': ['Persistent cough', 'Weight loss', 'Night sweats'],
    'preventions': ['TB vaccine (in some cases)'],
    'medicines': ['Antibiotics for active TB'],
    'precautions': ['Isolation during infectious period'],
  },
  {
    'name': 'HIV/AIDS',
    'symptoms': ['Fatigue', 'Fever', 'Unexplained weight loss'],
    'preventions': ['Safe sex practices', 'Pre-exposure prophylaxis (PrEP)'],
    'medicines': ['Antiretroviral therapy (ART)'],
    'precautions': ['Regular testing', 'Avoid sharing needles'],
  },
  {
    'name': 'Malaria',
    'symptoms': ['Fever', 'Chills', 'Sweating'],
    'preventions': ['Antimalarial medications', 'Bed nets'],
    'medicines': ['Antimalarial drugs'],
    'precautions': ['Use insect repellent', 'Sleep under bed nets'],
  },
  {
    'name': 'Dengue Fever',
    'symptoms': ['High fever', 'Severe headache', 'Joint pain'],
    'preventions': ['Mosquito control measures', 'Avoiding mosquito bites'],
    'medicines': ['Pain relievers'],
    'precautions': ['Eliminate standing water', 'Use mosquito repellent'],
  },
  {
    'name': 'Cholera',
    'symptoms': ['Diarrhea', 'Vomiting', 'Dehydration'],
    'preventions': ['Safe water and food practices', 'Cholera vaccine'],
    'medicines': ['Oral rehydration solution (ORS)'],
    'precautions': ['Sanitation and hygiene measures'],
  },
  {
    'name': 'Measles',
    'symptoms': ['High fever', 'Cough', 'Runny nose'],
    'preventions': ['Measles vaccine', 'Vitamin A supplementation'],
    'medicines': ['Fever reducers'],
    'precautions': ['Isolation during illness', 'Supportive care'],
  },
  {
    'name': 'Pneumonia',
    'symptoms': ['Chest pain', 'Difficulty breathing', 'Fever'],
    'preventions': ['Pneumococcal vaccine', 'Influenza vaccine'],
    'medicines': ['Antibiotics for bacterial pneumonia'],
    'precautions': ['Good respiratory hygiene', 'Quitting smoking'],
  },
  {
    'name': 'Hepatitis',
    'symptoms': ['Jaundice', 'Abdominal pain', 'Fatigue'],
    'preventions': ['Hepatitis vaccines', 'Safe injection practices'],
    'medicines': ['Antiviral medications'],
    'precautions': ['Avoiding contact with infected blood'],
  },
  {
    'name': 'Typhoid Fever',
    'symptoms': ['High fever', 'Headache', 'Stomach pain'],
    'preventions': ['Typhoid vaccine', 'Safe food and water practices'],
    'medicines': ['Antibiotics for treatment'],
    'precautions': ['Good hygiene practices', 'Boil or treat drinking water'],
  },
  {
    'name': 'Polio',
    'symptoms': ['Fever', 'Fatigue', 'Headache'],
    'preventions': ['Polio vaccine (oral or injectable)'],
    'medicines': ['Supportive care'],
    'precautions': ['Vaccination campaigns', 'Enhanced sanitation'],
  },
  {
    'name': 'Mumps',
    'symptoms': ['Swollen salivary glands', 'Fever', 'Headache'],
    'preventions': ['MMR vaccine (Measles, Mumps, Rubella)'],
    'medicines': ['Pain relievers'],
    'precautions': ['Isolation during illness', 'Good respiratory hygiene'],
  },
  {
    'name': 'Rubella (German Measles)',
    'symptoms': [
      'Mild fever',
      'Swollen lymph nodes',
      'Rash that starts on the face and spreads'
    ],
    'preventions': ['MMR vaccine (Measles, Mumps, Rubella)'],
    'medicines': ['Symptomatic treatment'],
    'precautions': [
      'Vaccination as part of routine immunization',
      'Avoiding contact with infected individuals'
    ],
  },

  {
    'name': 'Whooping Cough (Pertussis)',
    'symptoms': [
      'Severe coughing fits',
      'Vomiting after coughing',
      'Runny nose'
    ],
    'preventions': ['DTaP vaccine (Diphtheria, Tetanus, Pertussis)'],
    'medicines': ['Antibiotics for treatment'],
    'precautions': [
      'Vaccination during pregnancy',
      'Vaccination of close contacts'
    ],
  },
  {
    'name': 'Norovirus Infection',
    'symptoms': ['Diarrhea', 'Vomiting', 'Stomach cramps'],
    'preventions': ['Hand hygiene', 'Safe food handling'],
    'medicines': ['Symptomatic treatment'],
    'precautions': [
      'Isolation during illness',
      'Thorough cleaning of contaminated surfaces'
    ],
  },
  {
    'name': 'Zika Virus',
    'symptoms': ['Fever', 'Rash', 'Joint pain'],
    'preventions': ['Avoiding mosquito bites', 'Safe sex practices'],
    'medicines': ['Symptomatic treatment'],
    'precautions': ['Using insect repellent', 'Screening and bed nets'],
  },
  {
    'name': 'Ebola Virus Disease',
    'symptoms': ['Fever', 'Severe headache', 'Muscle pain'],
    'preventions': ['Strict infection prevention and control measures'],
    'medicines': ['Supportive care'],
    'precautions': [
      'Quarantine of affected individuals',
      'Safe burial practices'
    ],
  },
  {
    'name': 'Lyme Disease',
    'symptoms': ['Bull\'s-eye rash', 'Fever', 'Joint pain'],
    'preventions': ['Tick avoidance', 'Wearing protective clothing'],
    'medicines': ['Antibiotics for treatment'],
    'precautions': ['Checking for ticks after outdoor activities'],
  },
  {
    'name': 'Rabies',
    'symptoms': ['Fever', 'Muscle spasms', 'Confusion'],
    'preventions': ['Pre-exposure vaccination for at-risk individuals'],
    'medicines': ['Post-exposure prophylaxis (PEP)'],
    'precautions': [
      'Avoiding contact with potentially rabid animals',
      'Seeking prompt medical care for bites'
    ],
  },
  {
    'name': 'Meningitis',
    'symptoms': ['Severe headache', 'Stiff neck', 'Fever'],
    'preventions': [
      'Meningococcal vaccine',
      'Haemophilus influenzae type b (Hib) vaccine'
    ],
    'medicines': ['Antibiotics for bacterial meningitis'],
    'precautions': [
      'Avoiding close contact with infected individuals',
      'Vaccination for at-risk populations'
    ],
  },
  {
    'name': 'Tetanus',
    'symptoms': ['Stiffness in muscles', 'Difficulty swallowing', 'Fever'],
    'preventions': ['DTaP vaccine (Diphtheria, Tetanus, Pertussis)'],
    'medicines': ['Tetanus immune globulin (TIG)'],
    'precautions': [
      'Vaccination as part of routine immunization',
      'Prompt wound care'
    ],
  },
  {
    'name': 'Yellow Fever',
    'symptoms': ['Fever', 'Jaundice', 'Muscle pain'],
    'preventions': ['Yellow fever vaccine', 'Mosquito control measures'],
    'medicines': ['Symptomatic treatment'],
    'precautions': [
      'Vaccination for travel to endemic areas',
      'Avoiding mosquito bites'
    ],
  },
  {
    'name': 'Hantavirus Pulmonary Syndrome',
    'symptoms': ['Fever', 'Muscle aches', 'Shortness of breath'],
    'preventions': [
      'Rodent control measures',
      'Avoiding contact with rodent droppings'
    ],
    'medicines': ['Supportive care'],
    'precautions': ['Sealing holes and cracks to prevent rodent entry'],
  },
  {
    'name': 'Avian Influenza (Bird Flu)',
    'symptoms': ['Fever', 'Cough', 'Shortness of breath'],
    'preventions': [
      'Preventing contact with infected birds',
      'Avian influenza vaccine (in some cases)'
    ],
    'medicines': ['Antiviral medications (in some cases)'],
    'precautions': [
      'Avoiding live bird markets',
      'Proper handling and cooking of poultry'
    ],
  },
  {
    'name': 'Lassa Fever',
    'symptoms': ['Fever', 'Headache', 'Bleeding'],
    'preventions': [
      'Rodent control measures',
      'Avoiding contact with infected rodents'
    ],
    'medicines': ['Antiviral medications'],
    'precautions': [
      'Storing food in rodent-proof containers',
      'Proper disposal of garbage'
    ],
  },
  {
    'name': 'Chikungunya',
    'symptoms': ['Fever', 'Joint pain', 'Rash'],
    'preventions': ['Mosquito control measures', 'Avoiding mosquito bites'],
    'medicines': ['Symptomatic treatment'],
    'precautions': ['Using insect repellent', 'Wearing long-sleeved clothing'],
  },

  {
    'name': 'Leishmaniasis',
    'symptoms': ['Skin sores', 'Fever', 'Enlarged spleen and liver'],
    'preventions': ['Avoiding sandfly bites', 'Using bed nets'],
    'medicines': ['Antiparasitic drugs'],
    'precautions': [
      'Insect repellent in endemic areas',
      'Wearing protective clothing'
    ],
  },
  {
    'name': 'Schistosomiasis',
    'symptoms': ['Abdominal pain', 'Blood in urine or stool', 'Fatigue'],
    'preventions': [
      'Avoiding contact with contaminated water',
      'Chemoprophylaxis (in some cases)'
    ],
    'medicines': ['Antiparasitic drugs'],
    'precautions': ['Avoiding swimming in freshwater in endemic areas'],
  },
  {
    'name': 'Trachoma',
    'symptoms': ['Eye discharge', 'Itching', 'Blurred vision'],
    'preventions': ['Facial cleanliness', 'Environmental improvements'],
    'medicines': ['Antibiotics for treatment'],
    'precautions': [
      'Promoting good hygiene practices',
      'Access to clean water and sanitation'
    ],
  },
  // Add more diseases as needed
];

List<Map<String, dynamic>> nonCommunicableDiseasesDetails = [
  {
    'name': 'Coronary artery disease',
    'symptoms': ['Chest pain or discomfort', 'Shortness of breath', 'Fatigue'],
    'preventions': ['Healthy lifestyle choices', 'Medications as prescribed'],
    'medicines': ['Statins', 'Aspirin', 'Beta-blockers'],
    'precautions': ['Regular exercise', 'Healthy diet'],
  },
  {
    'name': 'Stroke',
    'symptoms': [
      'Sudden numbness or weakness',
      'Confusion',
      'Trouble speaking or understanding speech'
    ],
    'preventions': ['Manage high blood pressure', 'Quit smoking'],
    'medicines': ['Anticoagulants', 'Antiplatelet drugs'],
    'precautions': ['Regular check-ups', 'Healthy diet'],
  },
  {
    'name': 'Heart failure',
    'symptoms': [
      'Shortness of breath',
      'Fatigue',
      'Swelling in legs or abdomen'
    ],
    'preventions': ['Manage underlying conditions', 'Regular exercise'],
    'medicines': ['ACE inhibitors', 'Beta-blockers', 'Diuretics'],
    'precautions': ['Monitor fluid intake', 'Regular medical check-ups'],
  },
  {
    'name': 'Hypertension',
    'symptoms': ['Headache', 'Fatigue', 'Vision problems'],
    'preventions': ['Healthy lifestyle choices', 'Limiting salt intake'],
    'medicines': ['Diuretics', 'Beta-blockers', 'ACE inhibitors'],
    'precautions': ['Regular blood pressure monitoring', 'Regular exercise'],
  },

  {
    'name': 'Breast cancer',
    'symptoms': [
      'Lump in the breast',
      'Changes in breast size or shape',
      'Unexplained pain'
    ],
    'preventions': [
      'Regular mammograms',
      'Self-exams',
      'Healthy lifestyle choices'
    ],
    'medicines': ['Chemotherapy', 'Hormone therapy', 'Targeted therapy'],
    'precautions': ['Regular breast screening', 'Healthy diet'],
  },
  {
    'name': 'Lung cancer',
    'symptoms': ['Persistent cough', 'Chest pain', 'Shortness of breath'],
    'preventions': ['Quit smoking', 'Avoid exposure to secondhand smoke'],
    'medicines': ['Chemotherapy', 'Immunotherapy', 'Targeted therapy'],
    'precautions': ['Avoid tobacco smoke', 'Regular medical check-ups'],
  },
  {
    'name': 'Colorectal cancer',
    'symptoms': ['Change in bowel habits', 'Blood in stool', 'Abdominal pain'],
    'preventions': ['Regular screenings', 'Healthy diet with fiber'],
    'medicines': ['Chemotherapy', 'Immunotherapy', 'Radiation therapy'],
    'precautions': ['Maintain a healthy weight', 'Regular exercise'],
  },
  {
    'name': 'Prostate cancer',
    'symptoms': ['Difficulty urinating', 'Blood in semen', 'Pelvic discomfort'],
    'preventions': [
      'Regular screenings',
      'Healthy diet with fruits and vegetables'
    ],
    'medicines': ['Hormone therapy', 'Chemotherapy', 'Radiation therapy'],
    'precautions': ['Maintain a healthy weight', 'Regular medical check-ups'],
  },
  // ... (Continue for other diseases)
  {
    'name': 'Chronic obstructive pulmonary disease (COPD)',
    'symptoms': ['Shortness of breath', 'Chronic cough', 'Wheezing'],
    'preventions': ['Quit smoking', 'Avoid exposure to lung irritants'],
    'medicines': ['Bronchodilators', 'Corticosteroids', 'Oxygen therapy'],
    'precautions': ['Pulmonary rehabilitation', 'Regular exercise'],
  },
  {
    'name': 'Asthma',
    'symptoms': ['Coughing', 'Shortness of breath', 'Chest tightness'],
    'preventions': [
      'Identify and avoid triggers',
      'Use inhalers as prescribed'
    ],
    'medicines': [
      'Bronchodilators',
      'Inhaled corticosteroids',
      'Leukotriene modifiers'
    ],
    'precautions': ['Create an asthma action plan', 'Regular check-ups'],
  },
  {
    'name': 'Diabetes mellitus',
    'symptoms': ['Increased thirst', 'Frequent urination', 'Fatigue'],
    'preventions': ['Healthy diet', 'Regular physical activity'],
    'medicines': ['Insulin', 'Oral medications (e.g., Metformin)'],
    'precautions': ['Regular blood sugar monitoring', 'Foot care'],
  },
  {
    'name': 'Obesity',
    'symptoms': ['Excess body weight', 'Increased fat around the waist'],
    'preventions': ['Balanced diet', 'Regular exercise'],
    'medicines': ['Medications for weight management (in some cases)'],
    'precautions': ['Lifestyle changes', 'Behavioral therapy'],
  },

  {
    'name': 'Osteoarthritis',
    'symptoms': ['Joint pain', 'Stiffness', 'Swelling'],
    'preventions': ['Maintain a healthy weight', 'Regular exercise'],
    'medicines': [
      'Pain relievers',
      'Nonsteroidal anti-inflammatory drugs (NSAIDs)'
    ],
    'precautions': ['Joint protection techniques', 'Physical therapy'],
  },
  {
    'name': 'Osteoporosis',
    'symptoms': ['Fractures', 'Loss of height', 'Back pain'],
    'preventions': [
      'Adequate calcium and vitamin D intake',
      'Weight-bearing exercises'
    ],
    'medicines': ['Bisphosphonates', 'Calcitonin', 'Hormone therapy'],
    'precautions': ['Fall prevention strategies', 'Bone density testing'],
  },
  {
    'name': "Alzheimer's disease",
    'symptoms': ['Memory loss', 'Confusion', 'Difficulty in problem-solving'],
    'preventions': ['Healthy lifestyle choices', 'Mental stimulation'],
    'medicines': ['Cholinesterase inhibitors', 'Memantine'],
    'precautions': ['Regular mental exercises', 'Safety measures at home'],
  },
  {
    'name': "Parkinson's disease",
    'symptoms': ['Tremors', 'Stiff muscles', 'Balance problems'],
    'preventions': ['Regular exercise', 'Healthy diet'],
    'medicines': ['Levodopa', 'Dopamine agonists', 'MAO-B inhibitors'],
    'precautions': ['Physical therapy', 'Fall prevention measures'],
  },

  {
    'name': 'Epilepsy',
    'symptoms': [
      'Seizures',
      'Temporary confusion',
      'Uncontrollable jerking movements'
    ],
    'preventions': ['Take medication as prescribed', 'Avoid triggers'],
    'medicines': ['Antiepileptic drugs (AEDs)'],
    'precautions': ['Regular medical check-ups', 'Lifestyle adjustments'],
  },
  {
    'name': 'Depression',
    'symptoms': [
      'Persistent sadness',
      'Loss of interest or pleasure',
      'Sleep disturbances'
    ],
    'preventions': ['Healthy lifestyle choices', 'Counseling or therapy'],
    'medicines': ['Antidepressants', 'Psychotherapy'],
    'precautions': [
      'Regular mental health check-ups',
      'Building a support system'
    ],
  },
  {
    'name': 'Anxiety disorders',
    'symptoms': ['Excessive worry', 'Restlessness', 'Difficulty concentrating'],
    'preventions': ['Stress management techniques', 'Healthy lifestyle habits'],
    'medicines': ['Antidepressants', 'Benzodiazepines'],
    'precautions': ['Therapy or counseling', 'Regular exercise'],
  },
  {
    'name': 'Schizophrenia',
    'symptoms': ['Hallucinations', 'Delusions', 'Disorganized thinking'],
    'preventions': ['Early intervention', 'Medication adherence'],
    'medicines': ['Antipsychotic medications', 'Psychosocial interventions'],
    'precautions': ['Regular psychiatric follow-ups', 'Community support'],
  },
  {
    'name': 'Gastroesophageal reflux disease (GERD)',
    'symptoms': [
      'Heartburn',
      'Regurgitation of stomach contents',
      'Chest pain'
    ],
    'preventions': ['Maintain a healthy weight', 'Avoid trigger foods'],
    'medicines': ['Antacids', 'H2 blockers', 'Proton pump inhibitors'],
    'precautions': ['Elevate the head of the bed', 'Eat smaller meals'],
  },
  {
    'name': 'Inflammatory bowel disease (IBD)',
    'symptoms': ['Abdominal pain', 'Diarrhea', 'Weight loss'],
    'preventions': ['Follow a balanced diet', 'Manage stress'],
    'medicines': ['Anti-inflammatory drugs', 'Immunosuppressants'],
    'precautions': [
      'Regular monitoring with a healthcare provider',
      'Surgery in severe cases'
    ],
  },
  {
    'name': 'Hemophilia',
    'symptoms': ['Excessive bleeding', 'Easy bruising', 'Joint pain'],
    'preventions': [
      'Regular medical care',
      'Avoid activities that may cause injury'
    ],
    'medicines': ['Clotting factor concentrates'],
    'precautions': ['Joint protection measures', 'Physical therapy'],
  },
  {
    'name': 'Sickle cell disease',
    'symptoms': ['Anemia', 'Painful crises', 'Frequent infections'],
    'preventions': ['Hydroxyurea therapy', 'Blood transfusions'],
    'medicines': ['Pain medications', 'Hydroxyurea'],
    'precautions': ['Stay hydrated', 'Regular medical check-ups'],
  },

  {
    'name': 'Chronic Kidney Disease (CKD)',
    'symptoms': [
      'Fatigue',
      'Swelling in the ankles, legs, or feet',
      'Shortness of breath'
    ],
    'preventions': ['Manage blood pressure', 'Control blood sugar levels'],
    'medicines': [
      'Blood pressure medications',
      'Erythropoiesis-stimulating agents'
    ],
    'precautions': ['Dietary changes', 'Regular kidney function monitoring'],
  },
  {
    'name': 'Thyroid disorders',
    'symptoms': ['Fatigue', 'Weight changes', 'Irregular heart rate'],
    'preventions': ['Adequate iodine intake', 'Regular thyroid function tests'],
    'medicines': ['Levothyroxine', 'Anti-thyroid medications'],
    'precautions': [
      'Regular follow-ups with an endocrinologist',
      'Medication adherence'
    ],
  },
  {
    'name': 'Rheumatoid arthritis',
    'symptoms': ['Joint pain', 'Swelling', 'Morning stiffness'],
    'preventions': ['Regular exercise', 'Balanced diet'],
    'medicines': [
      'Disease-modifying antirheumatic drugs (DMARDs)',
      'Biologics'
    ],
    'precautions': ['Joint protection techniques', 'Physical therapy'],
  },
  {
    'name': 'Lupus',
    'symptoms': ['Joint pain', 'Skin rashes', 'Fatigue'],
    'preventions': ['Sun protection', 'Healthy lifestyle choices'],
    'medicines': ['Anti-inflammatory drugs', 'Immunosuppressants'],
    'precautions': ['Regular rheumatology check-ups', 'Medication management'],
  },
];

class Disease {
  final String name;
  final List<String> symptoms;
  final List<String> preventions;
  final List<String> medicines;
  final List<String> precautions;

  Disease({
    required this.name,
    required this.symptoms,
    required this.preventions,
    required this.medicines,
    required this.precautions,
  });
}
