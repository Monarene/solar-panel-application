import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  double lengthOfTheRoad;
  double widthOfTheRoad;
  double numberOf100Lightening;
  double numberOf50Lightening;
  double voltageOfBattery;
  double wattsOfEachSolarPanel;
  double daysOfAutonomyOfBattery;
  double wattsOfEachLed;
  double tiltAngle;
  double rating;

  ResultsPage(
      {this.lengthOfTheRoad,
      this.widthOfTheRoad,
      this.numberOf100Lightening,
      this.numberOf50Lightening,
      this.voltageOfBattery,
      this.wattsOfEachSolarPanel,
      this.daysOfAutonomyOfBattery,
      this.wattsOfEachLed,
      this.tiltAngle,
      this.rating});

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    double numberOfleds =
        ((widget.lengthOfTheRoad / widget.widthOfTheRoad) * 2) - 1;
    double totalLoadInWattHour = (numberOfleds *
        widget.wattsOfEachLed *
        (widget.numberOf100Lightening + (0.5 * widget.numberOf50Lightening)));
    double amphereHr =
        (totalLoadInWattHour / (0.85 * widget.voltageOfBattery)) *
            widget.daysOfAutonomyOfBattery;
    double heightOfPoles = (2 / 3 * widget.widthOfTheRoad);
    double peakCapacity = (totalLoadInWattHour * 1.3) / 3.2;
    double numberOfSolarpanels = (peakCapacity / widget.wattsOfEachSolarPanel);
    double sizeOfBattery =
        (totalLoadInWattHour * widget.daysOfAutonomyOfBattery * 1.25) /
            widget.voltageOfBattery;
    double numberOfBattery = (sizeOfBattery) / widget.rating;
    double sizeOfChargeController =
        (widget.wattsOfEachSolarPanel / widget.voltageOfBattery) * 1.25;
    double latitude = widget.tiltAngle - 2;
    double poleSpacing = widget.lengthOfTheRoad / numberOfleds;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Results page"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResultWidget(
                    resultValue: "${numberOfleds.ceil()}",
                    textValue: "Number of LEDs",
                    units: " ",
                  ),
                  ResultWidget(
                    textValue: "Total Load in watt hour (watthr)",
                    resultValue: "${totalLoadInWattHour.ceil()}",
                    units: "WattHour",
                  ),
                  ResultWidget(
                    textValue: "Height Of Pole (metres)",
                    resultValue: "${heightOfPoles.ceil()}",
                    units: "meters",
                  ),
                  ResultWidget(
                    textValue: "Peak Capacity (watthr)",
                    resultValue: "${peakCapacity.ceil()}",
                    units: "watthr",
                  ),
                  ResultWidget(
                    textValue: "Number of solar panels",
                    resultValue: "${numberOfSolarpanels.ceil()}",
                    units: " ",
                  ),
                  ResultWidget(
                    textValue: "Size of battery (Ah)",
                    resultValue: "${sizeOfBattery.ceil()}",
                    units: "(Ah)",
                  ),
                  ResultWidget(
                      textValue: "Number of Battery",
                      resultValue: "${numberOfBattery.ceil()}",
                      units: " "),
                  ResultWidget(
                      textValue: "Amphere Hour of the Battery (AmpereHour)",
                      resultValue: "${amphereHr.ceil()}",
                      units: "Ah"),
                  ResultWidget(
                    textValue: "Size of charge controller (Ampere)",
                    resultValue: "${sizeOfChargeController.ceil()}",
                    units: "amps",
                  ),
                  ResultWidget(
                    textValue: "Tilt Angle of solar panel",
                    resultValue: "${latitude.ceil()}",
                    units: "degrees",
                  ),
                  ResultWidget(
                    textValue: "Number of Poles",
                    resultValue: "${numberOfleds.ceil()}",
                    units: "",
                  ),
                  ResultWidget(
                    textValue: "Pole Spacing",
                    resultValue: "${poleSpacing.ceil()}",
                    units: "metrees",
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {
  final String resultValue;
  final String textValue;
  final String units;
  const ResultWidget({Key key, this.resultValue, this.textValue, this.units})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$textValue",
            style: TextStyle(fontSize: 22),
          ),
          Text("$resultValue $units", style: TextStyle(fontSize: 16)),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
