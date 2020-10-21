class Question {
  static const tblQuestion = 'questions';
  static const String colId = 'id';
  static const String colQuestion = 'question';
  static const String colOptions = 'options';
  static const String colAnswer = 'answer';
  static const String colScore = 'score';

  Question({this.id, this.question, this.options, this.answer, this.score});

  int id;
  int score = 1;
  String question;
  String options;
  String answer;

  Question.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    score = map[colScore];
    question = map[colQuestion];
    options = map[colOptions];
    answer = map[colAnswer];
  }

  Map<String, dynamic> toMap() {
// Note: For saving into SQLite we need convert contact object into Map object
    var map = <String, dynamic>{
      colQuestion: question,
      colOptions: options,
      colAnswer: answer,
      colScore: 1
    };
    if (id != null) map[colId] = id;
    return map;
  }
}
