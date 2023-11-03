///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
List<Map<String, String>> diabeticNutritionPlan = [
  {
    'category': 'Breakfast',
    'items': 'Scrambled eggs with spinach and tomatoes (cooked in olive oil),'
        ' A small serving of steel-cut oatmeal with ground flaxseeds,'
        ' A slice of whole-grain toast,'
        ' A cup of unsweetened almond milk or a serving of plain Greek yogurt,'
        ' A small apple or a handful of berries',
  },
  {
    'category': 'Lunch',
    'items': 'Grilled chicken or tofu salad with mixed greens, Cherry tomatoes, Cucumbers, Bell peppers,'
        ' A vinaigrette dressing made with olive oil and vinegar,'
        ' A serving of quinoa or brown rice,'
        ' A side of steamed broccoli or asparagus',
  },
  {
    'category': 'Snack',
    'items': 'A small handful of raw almonds or walnuts,'
        ' A few baby carrots with hummus,'
        ' A piece of string cheese or a serving of low-fat cottage cheese,'
        ' Herbal tea or water',
  },
  {
    'category': 'Dinner',
    'items': 'Baked salmon or a plant-based protein source like lentils,'
        ' Steamed or roasted non-starchy vegetables like Brussels Sprouts, Green beans, Cauliflower,'
        ' A small serving of whole-grain pasta or brown rice,'
        ' A side salad with a light vinaigrette dressing',
  },
  {
    'category': 'Snack (if needed)',
    'items': 'A piece of fruit (e.g. a small orange or a few strawberries),'
        ' Plain low-fat Greek yogurt with a drizzle of honey',
  },
  {
    'category': 'General Tips',
    'items': 'Aim for balanced meals with a mix of lean protein and complex carbohydrates and fiber and healthy fats,'
        ' Control portion sizes to manage carbohydrate intake,'
        ' Choose whole grains and avoid refined grains,'
        ' Incorporate non-starchy vegetables in your meals,'
        ' Opt for healthy cooking methods like grilling and baking and steaming,'
        ' Stay hydrated with water or herbal teas,'
        ' Limit added sugars and processed foods,'
        ' Monitor your blood sugar levels regularly and adjust your diet as needed.',
  },
];


///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
List<Map<String, String>> diabeticExercisePlan = [
  {
    "day": "Day 1",
    "activity": "Aerobic Exercise (e.g., Walking)",
    "warmUp": "5-10 minutes of light stretching",
    "exercise": "30 minutes of brisk walking",
    "coolDown": "5-10 minutes of gentle stretching",
    "monitorBloodSugar": "Monitor blood sugar levels before and after exercise"
  },
  {
    "day": "Day 2",
    "activity": "Strength Training (e.g., Resistance Exercises)",
    "warmUp": "5-10 minutes of light cardio (e.g., jumping jacks)",
    "exercise": "20-30 minutes of strength training (focus on major muscle groups)",
    "coolDown": "5-10 minutes of stretching",
    "monitorBloodSugar": "Monitor blood sugar levels before and after exercise"
  },
  {"day": "Day 3", "activity": "Rest or Gentle Yoga", "description": "Rest or engage in gentle yoga or stretching exercises to enhance flexibility and balance. Monitor blood sugar levels as needed."},
  {
    "day": "Day 4",
    "activity": "Aerobic Exercise (e.g., Cycling)",
    "warmUp": "5-10 minutes of light stretching",
    "exercise": "30 minutes of cycling",
    "coolDown": "5-10 minutes of gentle stretching",
    "monitorBloodSugar": "Monitor blood sugar levels before and after exercise"
  }];

///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
List<Map<String, String>> diabeticBloodGluosePlan = [
  {
    "name": "Why Monitor Blood Glucose?",
    "Control":
        "Regular monitoring helps maintain optimal blood sugar levels, which is crucial in managing diabetes.",
    "Prevention":
        "It helps prevent complications associated with high or low blood sugar.",
    "Treatment Adjustment":
        "Monitoring guides adjustments in medication, diet, and exercise routines.",
    "Awareness":
        "Provides insight into how different foods, activities, and stress affect blood sugar levels."
  },
  {
    "name": "How to Monitor Blood Glucose?",
    "Glucometer":
        "Diabetic individuals often use a glucometer, a portable device that measures blood sugar from a tiny blood sample (usually from a finger prick).",
    "Continuous Glucose Monitoring (CGM)":
        "Some may use CGM systems for real-time tracking, which involves wearing a sensor under the skin to monitor blood sugar levels continuously."
  },
  {
    "name": "When to Monitor?",
    "Frequency":
        "Monitoring frequency varies from person to person but often includes multiple daily measurements.",
    "Routine":
        "Common times for monitoring include before meals, after meals, before bedtime, and if experiencing symptoms like dizziness or shakiness."
  },
  {
    "name": "Target Blood Sugar Levels",
    "Fasting Blood Sugar":
        "Typically between 70-130 mg/dL (milligrams per deciliter).",
    "Post-Meal (2 hours after eating)": "Less than 180 mg/dL."
  },
  {
    "name": "Recording and Tracking",
    "Keeping Records":
        "It's essential to keep a log of blood sugar readings and related factors like food, exercise, and medications.",
    "Apps and Devices":
        "Many glucometers and CGMs can sync data with smartphone apps or other devices to facilitate tracking."
  },
  {
    "name": "Hyperglycemia (High Blood Sugar)",
    "Symptoms":
        "Symptoms include excessive thirst, frequent urination, fatigue, and blurred vision.",
    "Treatment":
        "Treatment may involve adjusting medications, increasing physical activity, or modifying the diet."
  },
  {
    "name": "Consultation with Healthcare Providers",
    "Information":
        "A healthcare provider can help establish an individualized monitoring plan.",
    "Target Ranges":
        "They may also suggest target ranges specific to the patient's diabetes type and overall health."
  }
];

///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>
///////////////------------>>>>>>>>>>>>>>

List<Map<String, dynamic>> medicationDataPlan = [
  {
    "type": "type_1_diabetes",
    "category": "insulin",
    "medications": [
      {
        "medication_name": "Rapid-Acting Insulin",
        "description":
            "Rapid-acting insulin is used to control blood sugar spikes after meals. It works quickly and should be taken just before or after eating.",
        "dosage": "Varies based on individual needs",
        "administration": "Subcutaneous injection",
        "frequency": "Before or after meals",
        "provider_instructions":
            "Administer as directed by your healthcare provider."
      },
      {
        "medication_name": "Long-Acting Insulin",
        "description":
            "Long-acting insulin provides a steady release of insulin over an extended period, helping to maintain blood sugar levels between meals and overnight.",
        "dosage": "Varies based on individual needs",
        "administration": "Subcutaneous injection",
        "frequency": "Once or twice daily",
        "provider_instructions":
            "Administer as directed by your healthcare provider."
      }
    ]
  },
  {
    "type": "type_2_diabetes",
    "category": "oral_medications",
    "medications": [
      {
        "medication_name": "Metformin",
        "description":
            "Metformin is a first-line medication for Type 2 diabetes. It helps lower blood sugar levels by reducing the amount of glucose produced by the liver and increasing insulin sensitivity.",
        "dosage": "500mg - 2000mg per day",
        "administration": "Oral tablet",
        "frequency": "1-3 times daily with meals",
        "provider_instructions":
            "Take as prescribed by your healthcare provider."
      },
      {
        "medication_name": "Sulfonylureas",
        "description":
            "Sulfonylureas stimulate the pancreas to release more insulin, helping lower blood sugar levels.",
        "dosage": "Varies based on the specific sulfonylurea medication",
        "administration": "Oral tablet",
        "frequency": "Once or twice daily with meals",
        "provider_instructions":
            "Take as prescribed by your healthcare provider."
      },
      {
        "medication_name": "DPP-4 Inhibitors",
        "description":
            "DPP-4 inhibitors help lower blood sugar levels by increasing the amount of insulin released by the pancreas and reducing the amount of glucose produced by the liver.",
        "dosage": "Varies based on the specific DPP-4 inhibitor medication",
        "administration": "Oral tablet",
        "frequency": "Once daily",
        "provider_instructions":
            "Take as prescribed by your healthcare provider."
      },
      {
        "medication_name": "GLP-1 Receptor Agonists",
        "description":
            "GLP-1 receptor agonists stimulate the release of insulin, reduce appetite, and slow the emptying of the stomach, leading to better blood sugar control.",
        "dosage":
            "Varies based on the specific GLP-1 receptor agonist medication",
        "administration": "Subcutaneous injection or oral tablet",
        "frequency": "As prescribed by your healthcare provider",
        "provider_instructions":
            "Administer as directed by your healthcare provider."
      },
      {
        "medication_name": "SGLT2 Inhibitors",
        "description":
            "SGLT2 inhibitors help the kidneys remove excess glucose from the body through urine, thereby lowering blood sugar levels.",
        "dosage": "Varies based on the specific SGLT2 inhibitor medication",
        "administration": "Oral tablet",
        "frequency": "Once daily",
        "provider_instructions":
            "Take as prescribed by your healthcare provider."
      }
    ]
  },
  {
    "type": "type_2_diabetes",
    "category": "injectable_medications",
    "medications": [
      {
        "medication_name": "GLP-1 Receptor Agonists (Injectable)",
        "description":
            "Injectable GLP-1 receptor agonists are used to lower blood sugar levels. They work similarly to the oral form.",
        "dosage":
            "Varies based on the specific injectable GLP-1 receptor agonist medication",
        "administration": "Subcutaneous injection",
        "frequency": "As prescribed by your healthcare provider",
        "provider_instructions":
            "Administer as directed by your healthcare provider."
      },
      {
        "medication_name": "Insulin (Type 2 Diabetes)",
        "description":
            "Some people with Type 2 diabetes may eventually require insulin therapy if other medications do not provide adequate blood sugar control.",
        "dosage": "Varies based on individual needs",
        "administration": "Subcutaneous injection",
        "frequency": "As prescribed by your healthcare provider",
        "provider_instructions":
            "Administer as directed by your healthcare provider."
      }
    ]
  }
];




////////--------------->>>>>>>>>>>>>Insulin Management
////////--------------->>>>>>>>>>>>>Insulin Management
////////--------------->>>>>>>>>>>>>Insulin Management
////////--------------->>>>>>>>>>>>>Insulin Management
////////--------------->>>>>>>>>>>>>Insulin Management
////////--------------->>>>>>>>>>>>>Insulin Management
List<Map<String, String>> insulinManagementData = [
  {
    "Consult with a healthcare provider": "If you have diabetes or suspect you might, it's important to consult with a healthcare provider for a proper diagnosis and personalized treatment plan."
  },
  {
    "Types of insulin": "There are different types of insulin with varying durations of action. These include rapid-acting, short-acting, intermediate-acting, and long-acting insulin. Your healthcare provider will determine the appropriate type(s) for your needs."    
  },
  {
    "Insulin delivery methods": "Insulin can be administered using insulin syringes, insulin pens, insulin pumps, or insulin inhalers. The choice of delivery method depends on individual preferences and medical recommendations."
  },
  {
    "Insulin dosing": "Your healthcare provider will work with you to determine the right insulin dosage to help keep your blood sugar levels within the target range. Dosage adjustments may be needed based on factors such as your diet, physical activity, and overall health."
  },
  {
    "Blood glucose monitoring": "Regularly monitor your blood glucose levels to ensure they are within the target range. This will help you and your healthcare provider make necessary adjustments to your insulin regimen."
  },
  {
    "Meal planning": "Plan your meals and snacks to coordinate with your insulin doses. This may involve counting carbohydrates and understanding how different foods affect your blood sugar."
  },
  {
    "Exercise and physical activity": "Regular physical activity can help improve insulin sensitivity and blood sugar control. Coordinate your exercise routine with your insulin doses to prevent low blood sugar episodes."
  },
  {
    "Hypoglycemia (low blood sugar) management": "Learn to recognize and treat low blood sugar symptoms, which may include shakiness, sweating, confusion, and irritability. Have fast-acting carbohydrates (such as glucose tablets or juice) on hand to raise your blood sugar quickly."
  },
  {
    "Hyperglycemia (high blood sugar) management": "Be aware of the signs of high blood sugar, such as increased thirst, frequent urination, and fatigue. Follow your healthcare provider's guidance on how to address high blood sugar levels."
  },
  {
    "Regular follow-up": "Attend scheduled appointments with your healthcare provider to review your diabetes management plan and make any necessary adjustments."
  },
  {
    "Insulin storage": "Insulin should be stored according to the manufacturer's recommendations, typically in a cool, dark place. Insulin can lose effectiveness if exposed to extreme temperatures."
  },
  {
    "Education and support": "Consider joining a diabetes education program or support group to learn more about managing diabetes and to connect with others facing similar challenges."
  },
];
