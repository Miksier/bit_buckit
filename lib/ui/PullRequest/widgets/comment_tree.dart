import 'package:bucqit/config/config.dart';
import 'package:bucqit/models/commentDTO.dart';
import 'package:bucqit/ui/PullRequest/widgets/activity_comment.dart';
import 'package:bucqit/ui/Widgets/tree_view.dart';
import 'package:flutter/material.dart';

class CommentTree extends StatelessWidget {
  const CommentTree({this.comment,this.onPressed});

  final CommentDTO comment;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TreeView(
      startExpanded: true,
      children: _getCommentTree(comment),
    );
  }

  List<Widget> _getCommentTree(CommentDTO comment) {
    return [
      if (comment.comments.isNotEmpty)
        TreeViewChild(
            parent: _getWidget(comment: comment),
            children: comment.comments.map((e) => _getComment(e)).toList())
      else
        _getWidget(comment: comment)
    ];
  }

  Widget _getComment(CommentDTO comment) {
    if (comment.comments.isNotEmpty) {
      return Container(
        decoration: BoxDecoration(border: Border(left: BorderSide(width: 1, color: AppColors.appPrimary))),
        margin: const EdgeInsets.only(left:7),
        child: TreeViewChild(
            parent: _getWidget(comment: comment),
            children: comment.comments.map((e) => _getComment(e)).toList()),
      );
    } else {
      return Container(
        decoration: BoxDecoration(border: Border(left: BorderSide(width: 1, color: AppColors.appPrimary))),
        margin: const EdgeInsets.only(left:7),
          child: _getWidget(comment: comment));
    }
  }

  Widget _getWidget({@required CommentDTO comment}) {
    return ActivityComment(
        user: comment.author,
        comment: comment,
        onTap: onPressed,);
  }
}
