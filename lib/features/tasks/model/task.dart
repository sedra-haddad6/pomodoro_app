import '../enum/enum.dart';


class Task {
  String id;
  String title;
  String description;
  int expectedDuration;
  DateTime expectedDate;
  TaskStatus status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.expectedDuration,
    required this.expectedDate,
    required this.status,
  });

  
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "expectedDuration": expectedDuration,
      "expectedDate": expectedDate.toIso8601String(),
      "status": status.name,
    };
  }

  
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map["id"],
      title: map["title"],
      description: map["description"],
      expectedDuration: map["expectedDuration"],
      expectedDate: DateTime.parse(map["expectedDate"]),
      status: TaskStatus.values.firstWhere((e) => e.name == map["status"]),
    );
  }
}
