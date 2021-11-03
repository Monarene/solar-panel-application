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
  TextEditingController rating;

  // Defining the list values
  List<int> voltageList = [12, 24, 48];
  List<int> wattOfSolarPanelList = [150, 180, 200, 250, 300, 350, 400];
  List<int> wattOfLed = [10, 20, 30, 40, 50];

  // String selected values
  int selectedVoltage = 12;
  int selectedWattOfSolarPanel = 150;
  int selectedWattsOfEachLed = 10;
  //keyform state
  final _numberOfPanelsFormState = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    lengthOfTheRoad = TextEditingController();
    widthOfTheRoad = TextEditingController();
    numberOf100Lightening = TextEditingController();
    numberOf50Lightening = TextEditingController();
    voltageOfBattery = TextEditingController(text: selectedVoltage.toString());
    wattsOfEachSolarPanel =
        TextEditingController(text: selectedWattOfSolarPanel.toString());
    daysOfAutonomyOfBattery = TextEditingController();
    wattsOfEachLed =
        TextEditingController(text: selectedWattsOfEachLed.toString());
    ampereHrOfEachBattery = TextEditingController();
    tiltAngle = TextEditingController();
    rating = TextEditingController();
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
    rating.dispose();
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
                    variableName: "Rating of the Battery (Amps)",
                    controller: rating,
                    hintTextForTextField: "Battery rating",
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Voltage of the battery (volts) ",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.black87)),
                          child: DropdownButton<int>(
                            value: selectedVoltage,
                            items: voltageList.map((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text("$value"),
                              );
                            }).toList(),
                            onChanged: (int newValue) {
                              setState(() {
                                selectedVoltage = newValue;
                                voltageOfBattery.text = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Watts of Each solar panel (watts) ",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.black87)),
                          child: DropdownButton<int>(
                            value: selectedWattOfSolarPanel,
                            items: wattOfSolarPanelList.map((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text("$value"),
                              );
                            }).toList(),
                            onChanged: (int newValue) {
                              setState(() {
                                selectedWattOfSolarPanel = newValue;
                                wattsOfEachSolarPanel.text =
                                    newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  VariableWidget(
                    variableName: "Days of Autonomy of Battery (days)",
                    controller: daysOfAutonomyOfBattery,
                    hintTextForTextField: "Days of Autonomy",
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Watts of Each LED (watts) ",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.black87)),
                          child: DropdownButton<int>(
                            value: selectedWattsOfEachLed,
                            items: wattOfLed.map((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text("$value"),
                              );
                            }).toList(),
                            onChanged: (int newValue) {
                              setState(() {
                                selectedWattsOfEachLed = newValue;
                                wattsOfEachLed.text = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
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
                        // defining the parameters
                        if (_numberOfPanelsFormState.currentState.validate()) {
                          double lengthOfRoadInt =
                              double.parse(lengthOfTheRoad.text.trim());
                          double widthOfTheRoadInt =
                              double.parse(widthOfTheRoad.text.trim());
                          double numberOf100LighteningInt =
                              double.parse(numberOf100Lightening.text.trim());
                          double numberOf50LighteningInt =
                              double.parse(numberOf50Lightening.text.trim());
                          double voltageOfBatteryInt =
                              double.parse(voltageOfBattery.text.trim());
                          double wattsOfEachSolarPanelInt =
                              double.parse(wattsOfEachSolarPanel.text.trim());
                          double daysOfAutonomyOfBatteryInt =
                              double.parse(daysOfAutonomyOfBattery.text.trim());
                          double wattsOfEachLedInt =
                              double.parse(wattsOfEachLed.text.trim());
                          double ratingInt = double.parse(rating.text.trim());

                          double tiltAngleInt =
                              double.parse(tiltAngle.text.trim());
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
                                        rating: ratingInt,
                                      )));
                        }
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

  VariableWidget({
    Key key,
    this.controller,
    this.variableName,
    this.hintTextForTextField,
  }) : super(key: key);

  @override
  _VariableWidgetState createState() => _VariableWidgetState();
}

class _VariableWidgetState extends State<VariableWidget> {
  String isEmpty(String value) {
    if (value.isEmpty) {
      return "The field cannot be left empty";
    }
    return null;
  }

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
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9 .]')),
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

class DropDownListForm extends StatefulWidget {
  TextEditingController controller;
  List<int> variableList;
  String variableName;
  int selectedValue;

  DropDownListForm(
      {this.controller,
      this.variableList,
      this.variableName,
      this.selectedValue});
  @override
  _DropDownListFormState createState() => _DropDownListFormState();
}

class _DropDownListFormState extends State<DropDownListForm> {
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
            child: DropdownButton<int>(
              items: widget.variableList.map((int value) {
                return DropdownMenuItem<int>(
                  value: widget.selectedValue,
                  child: Text("$value"),
                );
              }).toList(),
              onChanged: (int newValue) {
                setState(() {
                  widget.selectedValue = newValue;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
