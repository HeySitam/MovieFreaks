
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/utils/random_name_generator.dart';

class GroupedListPage extends StatefulWidget{
  const GroupedListPage({super.key});

  @override
  State<GroupedListPage> createState() => _GroupedListPageState();
}

class _GroupedListPageState extends State<GroupedListPage> {
  late RandomNameGenerator nameGenerator;
  Map<String, List<String>>? groupedMap;
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
             return Column(
               children: [
                 Text("${groupedMap?.keys.elementAt(index1)}"),
                 ListView.builder(
                 itemCount: groupedMap?.values.elementAt(index1).length ?? 0,
                 physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 itemBuilder: (BuildContext context, int index2){
                   return Container(
                     height: 50,
                     color: Colors.redAccent,
                     child: Center(child: Text('${groupedMap?.values.elementAt(index1).elementAt(index2)}')),
                   );
                 },
               )
               ],
             );
           },
         )
      ),
    );
  }
}