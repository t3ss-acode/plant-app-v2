import 'package:flutter/material.dart';
import 'package:water_plant/widgets/generic_list/generic_list_item.dart';

class GenericList extends StatefulWidget {
  final List<GenericListItem> listItems;
  final bool includeTopPadding;
  final bool includeBottomPadding;

  const GenericList({
    super.key,
    required this.listItems,
    this.includeTopPadding = false,
    this.includeBottomPadding = false,
  });

  @override
  State<StatefulWidget> createState() => _GenericListState();
}

class _GenericListState extends State<GenericList> {
  static const double topOfListPadding = 24;
  static const double bottomOfListPadding = 24;
  static const double betweenItemsPadding = 12;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.listItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: _getPadding(index),
          child: widget.listItems.elementAt(index).build(),
        );
      },
    );
  }

  _getPadding(int index) {
    bool topItem = index == 0;
    bool bottomItem = index == widget.listItems.length - 1;

    double topPadding =
        topItem && widget.includeTopPadding ? topOfListPadding : 0;

    double bottomPadding = !bottomItem
        ? betweenItemsPadding
        : widget.includeBottomPadding
            ? bottomOfListPadding
            : 0;

    return EdgeInsets.fromLTRB(
      20,
      topPadding,
      25,
      bottomPadding,
    );
  }
}
