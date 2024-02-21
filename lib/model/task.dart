class Task {
  String title;
  String description;
  int? id;
  DateTime? createdAt;

  Task({
    required this.title,
    required this.description,
    this.createdAt,
    this.id,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      description: map['description'],
      createdAt: DateTime.parse(map['created_at']),
      id: map['id'],
    );
  }

  toMap() {
    return id != null
        ? {
            "title": title,
            "description": description,
            "id": id,
          }
        : {
            "title": title,
            "description": description,
          };
  }
}
