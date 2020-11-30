class Schedule {
  final int id;
  final String name;
  final String date;
  final int integral;
  final int progress;

  Schedule({this.id, this.name, this.date, this.integral, this.progress});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'integral': integral,
      'progress': progress
    };
  }
}