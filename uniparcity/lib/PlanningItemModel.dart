class PlanningItem {
  final int id;
  final int studentId;
  final String description;
  final DateTime dueDate;
  bool open = false;

  PlanningItem({
    required this.id,
    required this.studentId,
    required this.description,
    required this.dueDate,
    required this.open,
  });

  factory PlanningItem.fromJson(Map<String, dynamic> json) {
    return PlanningItem(
      id: json['id'],
      studentId: json['studentId'],
      description: json['description'],
      dueDate: json['dueDate'],
      open: json['open'],
    );
  }
}