import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final Function? leadingOnpressed;
  final Function? trailingOnpressed;
  final bool editMode;
  const TodoCard({
    Key? key,
    required this.title,
    required this.description,
    this.editMode = false,
    this.leadingOnpressed,
    this.trailingOnpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            color: Colors.teal,
            onPressed: () {
              if (leadingOnpressed != null) {
                leadingOnpressed!();
              }
            }),
        trailing: IconButton(
            icon: Icon(Icons.settings),
            color: Colors.teal,
            onPressed: () {
              if (leadingOnpressed != null) {
                trailingOnpressed!();
              }
            }),
        title: _EditTextBox(
          text: title,
          editMode: editMode,
        ),
        subtitle: _EditTextBox(
          text: description,
          editMode: editMode,
        ),
      ),
    );
  }
}

class _EditTextBox extends StatelessWidget {
  final bool editMode;
  final String text;
  const _EditTextBox({
    Key? key,
    required this.text,
    this.editMode = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!editMode) {
      return Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    } else {
      final textController = TextEditingController();
      // Add TextField here
      return Container(
        color: Colors.pink,
        height: 50,
        width: 50,
      );
    }
  }
}
