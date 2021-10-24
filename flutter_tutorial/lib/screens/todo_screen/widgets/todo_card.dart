import 'package:flutter/material.dart';
import 'package:flutter_tutorial/config/constants.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final Function? leadingOnpressed;
  final Function? trailingOnpressed;
  final bool editMode;
  final Function(String?) titeFieldOnChanged;
  final Function(String?) descriptionFieldOnChanged;
  const TodoCard({
    Key? key,
    required this.title,
    required this.description,
    required this.titeFieldOnChanged,
    required this.descriptionFieldOnChanged,
    this.editMode = false,
    this.leadingOnpressed,
    this.trailingOnpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
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
              onChanged: (text) {
                titeFieldOnChanged(text);
              },
            ),
            subtitle: _EditTextBox(
              text: description,
              editMode: editMode,
              onChanged: (text) {
                descriptionFieldOnChanged(text);
              },
            ),
          ),
        ),
        SizedBox(height: mediumSize),
      ],
    );
  }
}

class _EditTextBox extends StatelessWidget {
  final bool editMode;
  final String text;
  final Function(String?) onChanged;
  const _EditTextBox({
    Key? key,
    required this.text,
    required this.onChanged,
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
      // Add TextField here
      return TextField(
        decoration: InputDecoration(hintText: text),
        onChanged: (text) {
          onChanged(text);
        },
      );
    }
  }
}
