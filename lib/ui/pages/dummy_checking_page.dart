import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/providers/count_up_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/count_down_provider.dart';

class DummyCheckingPage extends StatefulWidget {
  @override
  State<DummyCheckingPage> createState() => _DummyCheckingPageState();
}

class _DummyCheckingPageState extends State<DummyCheckingPage> {
  // CountUpProvider? _upProvider;
  // CountDownProvider? _downProvider;

  @override
  void initState() {
    // _upProvider = Provider.of<CountUpProvider>(context,listen: false);
    // _downProvider = Provider.of<CountDownProvider>(context,listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _upProvider = Provider.of<CountUpProvider>(context,listen: true);
    // _downProvider = Provider.of<CountDownProvider>(context,listen: true);
    print("Build");
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CountUpProvider>(builder: (context,provider,child){
              return Text(provider.getCountUp.toString());
            }),
            SizedBox(height: 20,),
            Consumer2<CountUpProvider,CountDownProvider>(
              builder: (context,upProvider, downProvider,child) {
                return ElevatedButton(
                    onPressed: () {
                      upProvider.setCountUp();
                      downProvider.setCountDown();
                    },
                    child: Text("Click Here"));
              },
            ),
            SizedBox(height: 20,),
            Consumer<CountDownProvider>(builder: (context,provider,child){
              return Text(provider.getCountDown.toString());
            })
          ],
        ),
      ),
    );
  }
}
