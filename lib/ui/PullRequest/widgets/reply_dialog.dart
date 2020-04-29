import 'package:bucqit/config/config.dart';
import 'package:bucqit/models/ParentDTO.dart';
import 'package:bucqit/models/commentDTO.dart';
import 'package:flutter/material.dart';

class ReplyDialog extends StatefulWidget {
  final CommentDTO baseComment;
  const ReplyDialog({this.baseComment});

  @override
  ReplyDialogState createState() => ReplyDialogState();
}

class ReplyDialogState extends State<ReplyDialog> {
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        key: UniqueKey(),
        title: const Text("Reply"),
        actions: <Widget>[
          FlatButton(
            key: UniqueKey(),
            onPressed: () {
              final comment = CommentDTO(
                  text: _controller.text,
                  parent: ParentDTO(id: widget.baseComment.id));
              Navigator.pop(context, comment);
            },
            child: const Text(
              "Post",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.baseComment.text,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Center(
                  child: Icon(Icons.arrow_drop_up),
                )
              ],
            ),
          ),
          Container(
            color: AppColors.appPrimary,
            height: 1,
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: TextField(
                controller: _controller,
                maxLines: null,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Your reply"),
                keyboardType: TextInputType.multiline,
              ),
            ),
          )
        ],
      ),
    );
  }
}
