class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({
    required this.id,
    required this.question,
    required this.answer,
    required this.options,
  });
}

const List sample_data = [
  {
    "id": 1,
    "question": "Keyword for asynchronous functions in Dart?",
    "options": ["async", "await", "asyncronous", "sync"],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Platform Flutter is NOT designed to support?",
    "options": ['Android', 'iOS', 'Web', 'Windows'],
    "answer_index": 3,
  },
  {
    "id": 3,
    "question": "Memory location for a single letter or number?",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Command to output data in Dart?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question": "Primary purpose of 'super' keyword in Dart?",
    "options": ['Call superclass method', 'Instantiate object', 'Declare variable', 'Handle exceptions'],
    "answer_index": 0,
  },
  {
    "id": 6,
    "question": "NOT a valid data type in Dart?",
    "options": ['String', 'List', 'Map', 'Tuple'],
    "answer_index": 3,
  },
  {
    "id": 7,
    "question": "Purpose of 'const' keyword in Dart?",
    "options": ['Constant variable', 'Constructor', 'Class', 'Conditional statement'],
    "answer_index": 0,
  },
  {
    "id": 8,
    "question": "Purpose of 'setState' method in Flutter?",
    "options": ['Initialize widget state', 'Update UI asynchronously', 'Handle user input', 'Define app structure'],
    "answer_index": 1,
  },
  {
    "id": 9,
    "question": "Main function in Dart console app?",
    "options": ['Handle input', 'Define UI', 'Manage state', 'Initialize app'],
    "answer_index": 3,
  },
  {
    "id": 10,
    "question": "Common widget for screen navigation in Flutter?",
    "options": ['Container', 'Navigator', 'Scaffold', 'ListView'],
    "answer_index": 1,
  },
];
