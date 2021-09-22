import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  int lengthOfTheRoad;
  int widthOfTheRoad;
  int numberOf100Lightening;
  int numberOf50Lightening;
  int voltageOfBattery;
  int wattsOfEachSolarPanel;
  int daysOfAutonomyOfBattery;
  int wattsOfEachLed;
  int ampereHrOfEachBattery;
  int tiltAngle;

  ResultsPage(
      {this.lengthOfTheRoad,
      this.widthOfTheRoad,
      this.numberOf100Lightening,
      this.numberOf50Lightening,
      this.voltageOfBattery,
      this.wattsOfEachSolarPanel,
      this.daysOfAutonomyOfBattery,
      this.wattsOfEachLed,
      this.ampereHrOfEachBattery,
      this.tiltAngle});

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    int numberOfleds =
        ((widget.lengthOfTheRoad * widget.widthOfTheRoad) * 2) - 1;
    double totalLoadInWattHour = (numberOfleds *
        widget.wattsOfEachLed *
        widget.numberOf100Lightening *
        0.5 *
        widget.numberOf50Lightening);
    double heightOfPoles = (2 / 3 * widget.widthOfTheRoad);
    double peakCapacity = (totalLoadInWattHour * 1.3) / 3.2;
    double numberOfSolarpanels = (peakCapacity / widget.wattsOfEachSolarPanel);
    double sizeOfBattery =
        (totalLoadInWattHour * widget.daysOfAutonomyOfBattery * 2 * 1.25) /
            widget.voltageOfBattery;
    double numberOfBattery = (sizeOfBattery) / widget.ampereHrOfEachBattery;
    double sizeOfChargeController =
        (peakCapacity / widget.voltageOfBattery) * 1.25;
    int latitude = widget.tiltAngle - 2;

    return Scaffold(
        appBar: AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Text("Results page"),
    ));
  }
}
