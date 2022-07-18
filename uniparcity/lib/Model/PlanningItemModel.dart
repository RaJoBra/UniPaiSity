class PlanningItem {
  final String id;
  final int studentId;
  final String description;
  final int dueDate;
  bool open;

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

  Map<String, dynamic> toJson() => {
    'id': id,
    'studentId': studentId,
    'description': description,
    'dueDate': dueDate,
    'open': open
  };

  @override
  String toString() {
    return 'PlanningItem{id: $id, studentId: $studentId, description: $description, dueDate: $dueDate, open: $open';
  }
}