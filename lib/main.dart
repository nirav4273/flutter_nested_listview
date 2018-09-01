import 'package:flutter/material.dart';

void main()=>runApp(
    new MaterialApp(
      title: "Scroll App",
      home: Home(name: "FROM MATERIAL"),
    )
);


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Home(name: "TESTING",);
  }
}


class Home extends StatefulWidget{
  String name;
  Home({Key key,this.name}) : super(key:key);
  @override
  createState() => HomeState();
}
class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {

    String indexGet(int id){
      print("${id}");
      return "1";
    }
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext ctx, int rowIdx){
            return Container(
              child: Container(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/img${indexGet(rowIdx)}.jpg"),
                    ),
                    Container(
                        key: PageStorageKey("${rowIdx}_parent"),
                        height: 100.0,
                        child: ListView.builder(
                          itemCount: 25,
                          itemBuilder: (BuildContext c, int inx){
                            return Container(
                              padding: EdgeInsets.all(5.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1.0),
                                      borderRadius: BorderRadius.all(const Radius.circular(5.0))
                                  ),
                                  width: 100.0,
                                  child: Container(
                                    child: Center(
                                      child: Text("hello ${inx}"),
                                    ),
                                  )
                              ),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                        )
                    )
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}
