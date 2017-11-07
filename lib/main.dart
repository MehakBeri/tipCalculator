import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Tip Calculator',
    home:new TipCalcuator() ,
  ));

}



class TipCalcuator extends StatelessWidget {
  // This widget is the root of your application.
  double bill_amt=0.0;
  double tip_percentage=0.0;

  @override
  Widget build(BuildContext context) {
    //to create UI
    //create first input field
    TextField billAmtField= new TextField(
      decoration: new InputDecoration(
        labelText: "Bill amount(\$)"
      ),

      keyboardType: TextInputType.number,
      onChanged: (value){
        try{
          bill_amt= double.parse(value);
        }
        catch(exception){
          tip_percentage=0.0;
        }
      }
    );
        //create another text field
    TextField tipPercentageField= new TextField(
      decoration: new InputDecoration(
        labelText: "Tip %",
        hintText:"15"
      ),

      keyboardType: TextInputType.number,

      onChanged: (value)
        {
          try{
            tip_percentage=double.parse(value);
          }
          catch (exception){
            tip_percentage=0.0;
          }
        }
    );

    //create button
    RaisedButton calculateButton=  new RaisedButton(
        child: new Text("Calculate"),
        onPressed: (){
          //calculate tip and total
          double calculatedTip= bill_amt*tip_percentage/100.0;
          double total=bill_amt+calculatedTip;

          //generate dialog
          AlertDialog dialog = new AlertDialog(
            content: new Text("Tip: \$$calculatedTip \n" "Total: \$$total")
          );
          //show dialog
          showDialog(context: context, child: dialog);
    }
    );

    Container container= new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[billAmtField, tipPercentageField, calculateButton],
      ),
    );

    AppBar appBar= new AppBar(title: new Text("Tip Calculator"));
    Scaffold scaffold= new Scaffold(appBar: appBar, body: container,);
    return scaffold;

  }

}
