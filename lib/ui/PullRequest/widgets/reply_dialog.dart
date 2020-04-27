import 'package:bucqit/config/config.dart';
import 'package:bucqit/models/commentDTO.dart';
import 'package:flutter/material.dart';

class ReplyDialog extends StatefulWidget {
  final CommentDTO baseComment;
  ReplyDialog({this.baseComment});

  @override
  ReplyDialogState createState() => ReplyDialogState();
}

class ReplyDialogState extends State<ReplyDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reply"),
        actions: <Widget>[
          FlatButton(
            child: Text("Post"),
            onPressed: () {
              Navigator.pop(context,true);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
            )),
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
