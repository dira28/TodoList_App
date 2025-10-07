class TodoModel {
  int? id;
  String title;
  String description;
  String category;
  String startTime;
  String endTime;
  bool isDone;

  TodoModel({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.startTime,
    required this.endTime,
    this.isDone = false,
  });
}
