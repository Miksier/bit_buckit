import 'package:flutter/material.dart';

class TreeView extends InheritedWidget {
  final List<Widget> children;
  final bool startExpanded;

  TreeView({
    Key key,
    @required List<Widget> children,
    bool startExpanded = false,
  })  : children = children,
        startExpanded = startExpanded,
        super(
          key: key,
          child: _TreeViewData(
            children: children,
          ),
        );

  static TreeView of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(TreeView);
  }

  @override
  bool updateShouldNotify(TreeView oldWidget) {
    if (oldWidget.children == children &&
        oldWidget.startExpanded == startExpanded) {
      return false;
    }
    return true;
  }
}

class _TreeViewData extends StatelessWidget {
  final List<Widget> children;

  const _TreeViewData({
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: children.length,
      itemBuilder: (context, index) {
        return children.elementAt(index);
      },
    );
  }
}

class TreeViewChild extends StatefulWidget {
  final bool startExpanded;
  final Widget parent;
  final List<Widget> children;
  final VoidCallback onLongPress;

  TreeViewChild({
    @required this.parent,
    @required this.children,
    this.startExpanded,
    this.onLongPress,
    Key key,
  }) : super(key: key) {
    assert(parent != null);
    assert(children != null);
  }

  @override
  TreeViewChildState createState() => TreeViewChildState();

  TreeViewChild copyWith(
    TreeViewChild source, {
    bool startExpanded,
    Widget parent,
    List<Widget> children,
    VoidCallback onTap,
  }) {
    return TreeViewChild(
      parent: parent ?? source.parent,
      startExpanded: startExpanded ?? source.startExpanded,
      onLongPress: onLongPress ?? source.onLongPress,
      children: children ?? source.children,
    );
  }
}

class TreeViewChildState extends State<TreeViewChild> {
  bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.startExpanded;
  }

  @override
  void didChangeDependencies() {
    isExpanded = widget.startExpanded ?? TreeView.of(context).startExpanded;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onLongPress: widget.onLongPress ?? () => toggleExpanded(),
          child: widget.parent,
        ),
        if (isExpanded)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.children,
          ),
      ],
    );
  }

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
