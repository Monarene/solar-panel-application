import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'results.dart';

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
  TextEditingController tiltAngle;

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
    tiltAngle = TextEditingController();
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
    tiltAngle.dispose();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VariableWidget(
                    variableName: "Length Of Road (metres)",
                    controller: lengthOfTheRoad,
                    hintTextForTextField: "Length of road",
                  ),
                  VariableWidget(
                    variableName: "Width Of Road (metres)",
                    controller: widthOfTheRoad,
                    hintTextForTextField: "Width Of Road",
                  ),
                  VariableWidget(
                    variableName: "Number of Hours of 100% lightening (hours)",
                    controller: numberOf100Lightening,
                    hintTextForTextField: "100% hours",
                  ),
                  VariableWidget(
                    variableName: "Number of hours of 50% lightening (hours)",
                    controller: numberOf50Lightening,
                    hintTextForTextField: "50% hours",
                  ),
                  VariableWidget(
                    variableName: "Voltage of Battery (volts)",
                    controller: voltageOfBattery,
                    hintTextForTextField: "Voltage of Battery",
                  ),
                  VariableWidget(
                    variableName: "Watts of Each solar panel (watts)",
                    controller: wattsOfEachSolarPanel,
                    hintTextForTextField: "Watts of Each Panel",
                  ),
                  VariableWidget(
                    variableName: "Days of Autonomy of Battery (days)",
                    controller: daysOfAutonomyOfBattery,
                    hintTextForTextField: "Days of Autonomy",
                  ),
                  VariableWidget(
                    variableName: "Watts of Each LED (watts)",
                    controller: wattsOfEachLed,
                    hintTextForTextField: "Watts of Each LED",
                  ),
                  VariableWidget(
                    variableName: "Latitude",
                    controller: tiltAngle,
                    hintTextForTextField: "Latitude",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _numberOfPanelsFormState.currentState.validate();

                        // defining the parameters
                        int lengthOfRoadInt =
                            int.parse(lengthOfTheRoad.text.trim());
                        int widthOfTheRoadInt =
                            int.parse(widthOfTheRoad.text.trim());
                        int numberOf100LighteningInt =
                            int.parse(numberOf100Lightening.text.trim());
                        int numberOf50LighteningInt =
                            int.parse(numberOf50Lightening.text.trim());
                        int voltageOfBatteryInt =
                            int.parse(voltageOfBattery.text.trim());
                        int wattsOfEachSolarPanelInt =
                            int.parse(wattsOfEachSolarPanel.text.trim());
                        int daysOfAutonomyOfBatteryInt =
                            int.parse(daysOfAutonomyOfBattery.text.trim());
                        int wattsOfEachLedInt =
                            int.parse(wattsOfEachLed.text.trim());

                        int tiltAngleInt = int.parse(tiltAngle.text.trim());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultsPage(
                                      lengthOfTheRoad: lengthOfRoadInt,
                                      widthOfTheRoad: widthOfTheRoadInt,
                                      numberOf100Lightening:
                                          numberOf100LighteningInt,
                                      numberOf50Lightening:
                                          numberOf50LighteningInt,
                                      voltageOfBattery: voltageOfBatteryInt,
                                      wattsOfEachSolarPanel:
                                          wattsOfEachSolarPanelInt,
                                      daysOfAutonomyOfBattery:
                                          daysOfAutonomyOfBatteryInt,
                                      wattsOfEachLed: wattsOfEachLedInt,
                                      tiltAngle: tiltAngleInt,
                                    )));
                      },
                      child: Text("Submit")),
                  SizedBox(
                    height: 30,
                  )
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
  String hintTextForTextField;

  VariableWidget(
      {Key key, this.controller, this.variableName, this.hintTextForTextField})
      : super(key: key);

  @override
  _VariableWidgetState createState() => _VariableWidgetState();
}

class _VariableWidgetState extends State<VariableWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 20),
            child: Text(
              widget.variableName,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 200,
            alignment: Alignment.centerLeft,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String value) {
                if (value.isEmpty) {
                  return "The field cannot be left empty";
                }

                return null;
              },
              style: TextStyle(fontSize: 16),
              controller: widget.controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blue)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  hintText: widget.hintTextForTextField,
                  hintStyle: TextStyle(color: Color(0xff747272), fontSize: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        ],
      ),
    );
  }
}
