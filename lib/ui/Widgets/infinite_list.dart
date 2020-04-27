import 'package:bucqit/ui/Widgets/base_bloc.dart';
import 'package:flutter/material.dart';

class InfiniteList<T extends BaseBloc> extends StatefulWidget {
  @override
  _InfiniteListState<T> createState() => _InfiniteListState<T>();
  final bool shrinkWrap;
  final ScrollPhysics physics;
  final Object fetchMore;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final T bloc;
  const InfiniteList(
      {@required this.bloc,
      this.fetchMore,
      @required this.itemBuilder,
      this.itemCount,
      this.physics,
      this.shrinkWrap = false});
}

class _InfiniteListState<T extends BaseBloc> extends State<InfiniteList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  _InfiniteListState() {
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      widget.bloc.add(widget.fetchMore);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: widget.shrinkWrap,
      physics: widget.physics,
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
      controller: _scrollController,
    );
  }
}
