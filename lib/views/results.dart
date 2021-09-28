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
    double amphereHr =
        (totalLoadInWattHour / (0.85 * widget.voltageOfBattery)) *
            widget.daysOfAutonomyOfBattery;
    double heightOfPoles = (2 / 3 * widget.widthOfTheRoad);
    double peakCapacity = (totalLoadInWattHour * 1.3) / 3.2;
    double numberOfSolarpanels = (peakCapacity / widget.wattsOfEachSolarPanel);
    double sizeOfBattery =
        (totalLoadInWattHour * widget.daysOfAutonomyOfBattery * 2 * 1.25) /
            widget.voltageOfBattery;
    double numberOfBattery = (sizeOfBattery) / amphereHr;
    double sizeOfChargeController =
        (peakCapacity / widget.voltageOfBattery) * 1.25;
    int latitude = widget.tiltAngle - 2;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Results page"),
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Number of Leds: ${numberOfleds.ceil()}"),
                Text("Total Load in watt hour : ${totalLoadInWattHour.ceil()}"),
                Text("Height Of Pole: ${heightOfPoles.ceil()}"),
                Text("Peak Capacity: ${peakCapacity.ceil()}"),
                Text("Number of solar panels: ${numberOfSolarpanels.ceil()}"),
                Text("Size of battery: ${sizeOfBattery.ceil()}"),
                Text("Number of Battery; ${numberOfBattery.ceil()}"),
                Text("Amphere Hour of the Battery; ${amphereHr.ceil()}"),
                Text(
                    "Size of charge controller: ${sizeOfChargeController.ceil()}"),
                Text("Tilt Angle: ${latitude.ceil()}"),
              ],
            )),
      ),
    );
  }
}
