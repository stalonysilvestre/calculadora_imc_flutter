import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightControler= TextEditingController();
  TextEditingController heightControler= TextEditingController();
  GlobalKey <FormState> _formKey=GlobalKey<FormState>();
  String _infoText="Infome seus dados";
  void _resetField(){
    
    weightControler.text="";
    heightControler.text="";
    setState(() {
      _infoText="informe seus dados";
    });
    
  }
  void _calculate(){
    setState(() {
      double weight=double.parse(weightControler.text);
    double height=double.parse(heightControler.text)/100;
    double imc=weight/(height*height);
    print(imc);
    if(imc<18.6){
      _infoText="Abaixo do peso(${imc.toStringAsPrecision(4)})";
    }
   else if(imc>=18.6 && imc<24.9){
      _infoText="peso ideal(${imc.toStringAsPrecision(4)})";
    }
    else if(imc>=25.0 && imc<29.9){
      _infoText="Levemente acima do peso(${imc.toStringAsPrecision(4)})";
    }
    else if(imc>=29.9 && imc<34.9){
      _infoText="Obesidade grau 1(${imc.toStringAsPrecision(4)})";
    }
    else if(imc>=34.9 && imc<39.9){
      _infoText="obesidade grau 2(${imc.toStringAsPrecision(4)})";
    }
    else if(imc>=40){
      _infoText="obesidade grau 3(${imc.toStringAsPrecision(4)})";
    }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
          onPressed: _resetField,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_outline,size: 120.0,color: Colors.green),
            TextFormField(keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Peso em (kg)",
                labelStyle: TextStyle(color: Colors.green)
                  ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green,fontSize: 25.0),
                    controller: weightControler,
                    validator: (value){
                      if(value.isEmpty){
                        return "Insira seu peso";
                      }
                    },
             ),
            TextFormField(keyboardType: TextInputType.number,
             decoration: InputDecoration(labelText: "Altura em (cm)",
              labelStyle: TextStyle(color: Colors.green)
               ),
                textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green,fontSize: 25.0),
             controller: heightControler,
              validator: (value){
                      if(value.isEmpty){
                        return "Insira sua altura";
                      }
              }
             ),
             Padding(
               padding: EdgeInsets.only(top:10.0,bottom:10.0),
             child: Container(
               height: 50.0,
              child: RaisedButton(
               onPressed: (){
                 if(_formKey.currentState.validate()){
                   _calculate();
                 }
               },
              child: Text("Calcular",style: TextStyle(color: Colors.white,fontSize: 25.0),),
              color: Colors.green,
             )
             ),
             ),
            Text(_infoText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
        )
       ],
      ),)
      )
    );
  }
}