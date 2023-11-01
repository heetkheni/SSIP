List<Map<String, dynamic>> vaccineList = [
  {
    'name': 'Hepatitis B (HepB)',
    'shortUsage': 'Prevent Hepatitis B, a viral infection affecting the liver.',
    'totalDoses': 3,
    'marketPriceInRupees': 180,
    'doseDetails': [
      {'doseNumber': 1, 'time': 'At birth'},
      {'doseNumber': 2, 'time': '1-2 months'},
      {'doseNumber': 3, 'time': '6 months'},
    ],
    'detailedUse':
        'The Hepatitis B vaccine is administered to protect against the Hepatitis B virus, a serious liver infection. Administered in three doses, starting at birth, its a crucial part of childhood immunization programs.'
  },
  {
    'name': 'Rotavirus (RV)',
    'shortUsage':
        'Prevent Rotavirus infections, a common cause of severe diarrhea in infants.',
    'totalDoses': 2, // RV1 (2-dose series); RV5 (3-dose series)
    'marketPriceInRupees': 150,
    'doseDetails': [
      {'doseNumber': 1, 'time': '2 months (RV5: 2 months, RV1: 6 weeks)'},
      {'doseNumber': 2, 'time': '4 months (RV5: 4 months, RV1: 4 weeks)'},
    ],
    'detailedUse':
        'The Rotavirus vaccine protects against severe diarrhea caused by the Rotavirus. Administered as either a two-dose or three-dose series, its a vital part of childhood vaccination schedules.'
  },
  {
    'name': 'Diphtheria, Tetanus, and Acellular Pertussis (DTaP or DTP)',
    'shortUsage':
        'Protect against Diphtheria, Tetanus (Lockjaw), and Pertussis (Whooping Cough).',
    'totalDoses': 5,
    'marketPriceInRupees': 220,
    'doseDetails': [
      {'doseNumber': 1, 'time': '2 months'},
      {'doseNumber': 2, 'time': '4 months'},
      {'doseNumber': 3, 'time': '6 months'},
      {'doseNumber': 4, 'time': '15-18 months'},
      {'doseNumber': 5, 'time': '4-6 years'},
    ],
    'detailedUse':
        'The DTaP vaccine provides immunity against Diphtheria, Tetanus, and Pertussis. Administered in five doses, its a critical part of childhood immunization programs.'
  },
  {
    'name': 'Haemophilus Influenzae type b (Hib)',
    'shortUsage':
        'Prevent infections caused by the bacterium Haemophilus influenzae type b.',
    'totalDoses': 4,
    'marketPriceInRupees': 190,
    'doseDetails': [
      {'doseNumber': 1, 'time': '2 months'},
      {'doseNumber': 2, 'time': '4 months'},
      {
        'doseNumber': 3,
        'time':
            '6 months (optional if dose 1 at 2 months and dose 2 at 4 months)'
      },
      {'doseNumber': 4, 'time': '12-15 months'},
    ],
    'detailedUse':
        'The Hib vaccine protects against Haemophilus influenzae type b infections. Administered in four doses, its a crucial part of childhood immunization programs.'
  },
  {
    'name': 'Pneumococcal Conjugate (PCV)',
    'shortUsage':
        'Guard against infections caused by the bacterium Streptococcus pneumoniae.',
    'totalDoses': 4,
    'marketPriceInRupees': 210,
    'doseDetails': [
      {'doseNumber': 1, 'time': '2 months'},
      {'doseNumber': 2, 'time': '4 months'},
      {'doseNumber': 3, 'time': '6 months'},
      {'doseNumber': 4, 'time': '12-15 months'},
    ],
    'detailedUse':
        'The PCV vaccine prevents infections caused by Streptococcus pneumoniae. Administered in four doses, its an essential part of childhood immunization programs.'
  },
  {
    'name': 'Inactivated Poliovirus (IPV)',
    'shortUsage': 'Protect against Polio, a highly infectious viral disease.',
    'totalDoses': 4,
    'marketPriceInRupees': 190,
    'doseDetails': [
      {'doseNumber': 1, 'time': '2 months'},
      {'doseNumber': 2, 'time': '4 months'},
      {'doseNumber': 3, 'time': '6-18 months'},
      {'doseNumber': 4, 'time': '4-6 years'},
    ],
    'detailedUse':
        'The IPV vaccine provides immunity against Poliovirus, a highly infectious virus that can lead to paralysis and even death. Administered in four doses, starting at 2 months, its a vital part of childhood immunization programs.'
  },
  {
    'name': 'Measles, Mumps, Rubella (MMR)',
    'shortUsage': 'Prevent Measles, Mumps, and Rubella (German Measles).',
    'totalDoses': 2,
    'marketPriceInRupees': 170,
    'doseDetails': [
      {'doseNumber': 1, 'time': '12-15 months'},
      {'doseNumber': 2, 'time': '4-6 years'},
    ],
    'detailedUse':
        'The MMR vaccine is crucial in preventing Measles, Mumps, and Rubella, which can lead to severe health complications. Administered in two doses, its an essential part of childhood vaccination schedules.'
  },
  {
    'name': 'Varicella (VAR)',
    'shortUsage':
        'Guard against Chickenpox, a highly contagious viral infection.',
    'totalDoses': 2,
    'marketPriceInRupees': 180,
    'doseDetails': [
      {'doseNumber': 1, 'time': '12-15 months'},
      {'doseNumber': 2, 'time': '4-6 years'},
    ],
    'detailedUse':
        'The Varicella vaccine prevents Chickenpox, a highly contagious disease that can lead to discomfort and complications. Administered in two doses, its recommended to ensure immunity in children.'
  },
  {
    'name': 'Hepatitis A (HepA)',
    'shortUsage': 'Prevent Hepatitis A, a viral infection affecting the liver.',
    'totalDoses': 2,
    'marketPriceInRupees': 200,
    'doseDetails': [
      {'doseNumber': 1, 'time': '12-23 months'},
      {'doseNumber': 2, 'time': '6-18 months after dose 1'},
    ],
    'detailedUse':
        'The Hepatitis A vaccine offers protection against the Hepatitis A virus, a liver infection. Administered in two doses, it\'s crucial to prevent the spread of the virus in communities and high-risk areas.'
  },
  {
    'name': 'Tetanus, Diphtheria, and Acellular Pertussis (Tdap)',
    'shortUsage':
        'Boost immunity against Tetanus, Diphtheria, and Pertussis in older children and adults.',
    'totalDoses': 1,
    'marketPriceInRupees': 150,
    'doseDetails': [
      {'doseNumber': 1, 'time': '11-12 years'},
    ],
    'detailedUse':
        'The Tdap vaccine is given as a booster to enhance immunity against Tetanus, Diphtheria, and Pertussis in older children and adults. It helps maintain protection against these diseases.'
  },
  {
    'name': 'Human Papillomavirus (HPV)',
    'shortUsage':
        'Protect against certain types of HPV that can cause cervical cancer.',
    'totalDoses': '2 or 3 (depending on the age at the first dose)',
    'marketPriceInRupees': 250,
    'doseDetails': [
      {'doseNumber': 1, 'time': '11-12 years'},
      {'doseNumber': 2, 'time': '6-12 months after dose 1'},
      {
        'doseNumber': 3,
        'time':
            'For the third dose, if needed, it is typically given 6-12 months after the second dose'
      },
    ],
    'detailedUse':
        'The HPV vaccine is essential in preventing certain types of Human Papillomavirus that can lead to cervical cancer and other diseases. Administered as a two or three-dose series, it\'s crucial for the health of pre-teens and teens.'
  },
  {
    'name': 'Meningococcal (MenACWY)',
    'shortUsage':
        'Guard against Meningococcal disease, a severe bacterial infection.',
    'totalDoses': '2 doses (sometimes a booster at age 16)',
    'marketPriceInRupees': 230,
    'doseDetails': [
      {'doseNumber': 1, 'time': '11-12 years'},
      {'doseNumber': 2, 'time': '16 years (booster dose, if needed)'},
    ],
    'detailedUse':
        'The Meningococcal vaccine offers protection against Meningococcal disease, a severe bacterial infection. Administered in two doses, with a potential booster at age 16, its essential for the health and safety of adolescents.'
  },
];
