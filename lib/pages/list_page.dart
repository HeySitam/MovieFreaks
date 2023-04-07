import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/utils/random_name_generator.dart';
import 'package:flutter_ui_practice/widgets/list_page_item.dart';

class GroupedListPage extends StatefulWidget {
  const GroupedListPage({super.key});

  @override
  State<GroupedListPage> createState() => _GroupedListPageState();
}

class _GroupedListPageState extends State<GroupedListPage> {
  late RandomNameGenerator nameGenerator;
  Map<String, List<String>>? groupedMap;
  String? clickedHeader;

  @override
  void initState() {
    nameGenerator = RandomNameGenerator();
    groupedMap = nameGenerator.groupNamesMap;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grouped List Demo"),
      ),
      body: Container(
          child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: groupedMap?.length ?? 0,
        itemBuilder: (BuildContext context, int index1) {
          var key = groupedMap?.keys.elementAt(index1);
          var nameList = groupedMap?.values.elementAt(index1);
          return ListPageItem(headerKey: key.toString(), nameList: nameList ?? []);
        },
      )),
    );
  }
}
