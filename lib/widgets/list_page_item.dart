import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/providers/header_selection_provider.dart';
import 'package:provider/provider.dart';

class ListPageItem extends StatefulWidget {
  String headerKey;
  List<String> nameList;

  ListPageItem({required this.headerKey, required this.nameList, super.key});

  @override
  State<ListPageItem> createState() => _ListPageItemState();
}

class _ListPageItemState extends State<ListPageItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final selectionProvider =
        Provider.of<HeaderSelectionProvider>(context, listen: false);
    print('build HEre');
    return Card(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              bool shouldToggleCard =
                  selectionProvider.getSelectedHeader == widget.headerKey;
              if (shouldToggleCard) {
                selectionProvider
                    .setShouldExpand(!selectionProvider.getShouldExpand);
              }
              selectionProvider.setSelectedHeader(widget.headerKey);
            },
            child: Container(
              height: 50,
              color: Colors.amber,
              child: Center(child: Text(widget.headerKey)),
            ),
          ),

          Consumer<HeaderSelectionProvider>(
              builder: (context, provider, child) {
            bool _shouldExpand =
                provider.getSelectedHeader == widget.headerKey &&
                    provider.getShouldExpand;
            return AnimatedContainer(
              height: _shouldExpand ? widget.nameList.length * 50 : 0,
              duration: _shouldExpand
                  ? Duration(milliseconds: 600)
                  : Duration(milliseconds: 0),
              child: Visibility(
                visible: provider.getSelectedHeader == widget.headerKey,
                child: ListView.builder(
                  itemCount: widget.nameList.length ?? 0,
                  physics: NeverScrollableScrollPhysics(),
                  //  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.redAccent,
                      child:
                          Center(child: Text(widget.nameList.elementAt(index))),
                    );
                  },
                ),
              ),
            );
          }),
          //  ),
        ],
      ),
    );
  }
}
