// Dart classes inherently work as interfaces
// This means that it is easy to create a so called "data class"
// Data classes main responsibility is to keep track of data.
// Data classes also usually have a "copy with" method.
// A copy with method is returns a new class with altered and unaltered values.
// Mutating variables is usually really bad and copy with solves that problem

class Todo {
  final String id;
  final String title;
  final String description;
  final DateTime created;
  final bool isDone;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.created,
    required this.isDone,
  });

  copyWith({
    String? title,
    String? description,
    DateTime? created,
    bool? isDone,
  }) {
    return Todo(
      id: this.id, // id will never change in this case
      title: title ?? this.title,
      description: description ?? this.description,
      created: created ?? this.created,
      isDone: isDone ?? this.isDone,
    );
  }

  bool get isValid => title.isNotEmpty && description.isNotEmpty;
}
