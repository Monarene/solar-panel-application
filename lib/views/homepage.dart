import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // TextControllers
  TextEditingController lengthOfTheRoad;
  TextEditingController widthOfTheRoad;
  TextEditingController numberOf100Lightening;
  TextEditingController numberOf50Lightening;
  TextEditingController voltageOfBattery;
  TextEditingController wattsOfEachSolarPanel;
  TextEditingController daysOfAutonomyOfBattery;
  TextEditingController wattsOfEachLed;
  TextEditingController ampereHrOfEachBattery;

  //keyform state
  final _numberOfPanelsFormState = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lengthOfTheRoad = TextEditingController();
    widthOfTheRoad = TextEditingController();
    numberOf100Lightening = TextEditingController();
    numberOf50Lightening = TextEditingController();
    voltageOfBattery = TextEditingController();
    wattsOfEachSolarPanel = TextEditingController();
    daysOfAutonomyOfBattery = TextEditingController();
    wattsOfEachLed = TextEditingController();
    ampereHrOfEachBattery = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    lengthOfTheRoad.dispose();
    widthOfTheRoad.dispose();
    numberOf100Lightening.dispose();
    numberOf50Lightening.dispose();
    voltageOfBattery.dispose();
    wattsOfEachSolarPanel.dispose();
    daysOfAutonomyOfBattery.dispose();
    wattsOfEachLed.dispose();
    ampereHrOfEachBattery.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _numberOfPanelsFormState,
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VariableWidget(variableName: "Length Of Road", controller: lengthOfTheRoad,),
                FlatButton(onPressed: () {
                  print(lengthOfTheRoad.text);
                }, child: Text("Submit"))

              ],
            ),
          ),
        ),
      )
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class VariableWidget extends StatefulWidget {
  TextEditingController controller;
  String variableName;

  VariableWidget({
    Key key, this.controller, this.variableName
  }) : super(key: key);

  @override
  _VariableWidgetState createState() => _VariableWidgetState();
}

class _VariableWidgetState extends State<VariableWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text(
            widget.variableName,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black,
                fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            autovalidateMode:
            AutovalidateMode.onUserInteraction,
            validator: (String value) {
              if (value.isEmpty) {
                return "The field cannot be left empty";
              }

              return null;
            },
            style: TextStyle(fontSize: 16),
            controller: widget.controller,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 0),
                hintText: "Name Of Business",
                hintStyle: TextStyle(
                    color: Color(0xff747272), fontSize: 16),
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(10)))),
          ),
        ],
      ),
    );
  }
}