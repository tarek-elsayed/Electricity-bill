import 'package:flutter/material.dart';

class Bill extends StatefulWidget {
  @override
  _BillPage createState() => _BillPage();
}

class _BillPage extends State<Bill> {
  TextEditingController value1 = new TextEditingController();
  TextEditingController value2 = new TextEditingController();
  double val1, val2;
  double resultValue, resultVal = 0;
  String _b = "";
  String _a = '';
  String _pound = "L.E";
  String _KW = 'K.W';

  BoxDecoration containerDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.black, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(3)),
    );
  }

  Widget txt(String text) {
    return Text(
      "$text",
      style: TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  Widget textField(String text, TextEditingController x) {
    return Container(
      height: 50,
      width: 150,
      child: TextFormField(
        validator: (value) {
          RegExp x = new RegExp(r"^[0-9]{3}$");
          if (x.hasMatch(value) == false) {
            return "Please Enter Number";
          } else {
            return null;
          }
        },
        controller: x,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "$text",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2, color: Colors.black, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Colors.lightBlueAccent,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
      ),
    );
  }

  Widget txt1(String text) {
    return Text(
      "$text :",
      style: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  onPress() {
    setState(() {
      bool result = key.currentState.validate();
      if (result == true) {
        print("true");
      } else {
        print('false');
      }

      val1 = double.parse(value1.text);
      val2 = double.parse(value2.text);
      resultValue = (val2 - val1);
      if (resultValue >= 1 && resultValue <= 50) {
        resultVal = resultValue * .38;
        _b = resultVal.toStringAsFixed(3) + "L.E";
        _a = resultValue.toStringAsFixed(3) + "K.W";
      } else if (resultValue >= 50 && resultValue <= 100) {
        resultVal = resultValue * .48;
        _b = resultVal.toStringAsFixed(3) + "L.E";
        _a = resultValue.toStringAsFixed(3) + "K.W";
      } else if (resultValue == 0 || resultValue >= 200) {
        resultVal = resultValue * .65;
        _b = resultVal.toStringAsFixed(3) + "L.E";
        _a = resultValue.toStringAsFixed(3) + "K.W";
      } else {
        resultVal = 0;
        _b = resultVal.toString() + "L.E";
        _a = resultValue.toString() + "K.W";
      }
      x = Cont();
    });
  }

  Widget Cont() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Text(
                "The Value",
                style: TextStyle(fontSize: 20),
              ),
              Padding(padding: EdgeInsets.only(right: 70)),
              Text(
                "Consumption",
                style: TextStyle(fontSize: 20),
              ),
              Padding(padding: EdgeInsets.only(right: 20)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 22,
                ),
                child: Text(
                  "$_b",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 80),
                child: Text(
                  "$_a ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 20)),
            ],
          ),
        ],
      ),
    );
  }

  Container x = Container();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: txt("El Fatorah"),
        centerTitle: true,
      ),
      body: Form(
        key: key,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey[200],
                  Colors.teal,
                ],
              )),
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  txt1("Previous"),
                  Padding(padding: EdgeInsets.only(right: 10)),
                  textField("Previous", value1),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 40)),
              Row(
                children: [
                  txt1("Current"),
                  Padding(padding: EdgeInsets.only(right: 27)),
                  textField("Current", value2),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 40,
                  decoration: containerDecoration(),
                  child: RaisedButton(
                    onPressed: onPress,
                    child: Text("Result"),
                    textColor: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              x,
            ],
          ),
        ),
      ),
    );
  }
}
