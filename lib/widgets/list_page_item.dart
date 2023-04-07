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
  @override
  Widget build(BuildContext context) {
    final selectionProvider =
        Provider.of<HeaderSelectionProvider>(context, listen: false);
    print('build');
    return Container(
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    selectionProvider.setSelectedHeader(widget.headerKey);
                  },
                  child: Container(
                    height: 50,
                    color: Colors.amber,
                    child: Center(child: Text(widget.headerKey)),
                  )),
              AnimatedSize(
                duration: Duration(milliseconds: 600),
                child: Consumer<HeaderSelectionProvider>(
                    builder: (context, provider, child) {
                  return Visibility(
                    visible: provider.getSelectedHeader == widget.headerKey,
                    maintainState: true,
                    maintainAnimation: true,
                    child: ListView.builder(
                      itemCount: widget.nameList.length ?? 0,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          color: Colors.redAccent,
                          child: Center(
                              child: Text(widget.nameList.elementAt(index))),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        );
  }
}
