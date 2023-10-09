import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  String? id;
  String title;
  String des;
  Todo({
      this.id,
    required this.title,
    required this.des,
  });

  @override
  List<Object> get props => [id!, title, des];

  Todo copyWith({
    String? id,
    String? title,
    String? des,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      des: des ?? this.des,
    );
  }
}
