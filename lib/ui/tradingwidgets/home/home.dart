import 'package:flutter/material.dart';
import 'package:htmlwidgets/bloC/main_layout_bloc.dart';
import 'package:htmlwidgets/core/screens.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}
class _HomeState extends State<Home> {

final mainLayoutBloC = MainLayoutBloC();

  @override
  void initState() {
    super.initState();
    mainLayoutBloC.onTapSetSelectedScreen(Screens.EconomicCalendar);
  }
  
 @override
  void dispose() {
    mainLayoutBloC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Duple Html Widgets",),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(onPressed: (){
            mainLayoutBloC.onTapSetSelectedScreen(Screens.EconomicCalendar);
          }, icon: Icon(Icons.money,color: Colors.white)),
          IconButton(onPressed: (){
             mainLayoutBloC.onTapSetSelectedScreen(Screens.MiniChart);
          }, icon: Icon(Icons.chat_rounded,color: Colors.white,)),
          IconButton(onPressed: (){
             mainLayoutBloC.onTapSetSelectedScreen(Screens.SingleTicker);
          }, icon: Icon(Icons.watch,color:Colors.white))
        ],),
        body:  Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<Screens>(
                          stream: mainLayoutBloC.selectedScreenStateStream,
                          builder: (context, screenSnapshot) {
                            if (screenSnapshot.hasData)
                              return Center(
                                child: mainLayoutBloC.selectedScreen(screenSnapshot.data,mainLayoutBloC),
                              );
                            return CircularProgressIndicator();
                          }),
          ),
        ),
                ),
    );
  }
}