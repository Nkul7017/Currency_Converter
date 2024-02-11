// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyConverterMaterialPage extends StatefulWidget{
const CurrencyConverterMaterialPage({super.key});

@override
State<CurrencyConverterMaterialPage> createState()=>_CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage>{

TextEditingController textEditingController=TextEditingController();
double result=0;

void convert()
{
  String inputText = textEditingController.text;
  if (inputText.isNotEmpty) {
    result = double.tryParse(inputText) ?? 0.0; 
    result *= 80;
    setState(() {});
  }
  else{
    result=0;
    setState(() {});
  }
}

// @override
//   void initState() {
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
   final border=OutlineInputBorder(
              borderSide:const BorderSide(
                // color: Colors.wh,
                width: 3.0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(10)
            );
    final border1=OutlineInputBorder(
              borderSide:const BorderSide(
                color: Colors.white,
                width: 3.0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(10)
            );
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 10,
        toolbarHeight: 70,
        centerTitle: false,
        title:const Text('Currency Converter',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 25,
        ),),
        // actions: [const Icon(Icons.close)],
        leading: TextButton(
    onPressed: () {
      SystemNavigator.pop();
    },
    child:const Icon(Icons.arrow_back_outlined),
  ),
        
       
      ),
      backgroundColor:Colors.black,
    body:Center(
      child: ColoredBox(
      color: Colors.black,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // margin:const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          // color: Colors.white,
          child: Text('${result!=0?result.toStringAsFixed(3):result.toStringAsFixed(0)} INR',
          style:const TextStyle(
          fontSize: 40,  
          color: Colors.white,
          fontWeight: FontWeight.bold,
          // backgroundColor: Colors.amber
          ),    
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: TextField(
            onSubmitted: (value){
               debugPrint(value);
            },
            style:const TextStyle(
              color:Colors.white,
            ),
            controller: textEditingController,
            decoration:InputDecoration(
              hintText: "Enter amount in USD",
              hintStyle:const TextStyle(
                color: Colors.white,
              ),
              suffixIcon:const Icon(Icons.monetization_on),
              suffixIconColor: Colors.white,
              filled: true,
              fillColor: Colors.grey,
              focusedBorder: border1,
              enabledBorder:border
            ) ,
            keyboardType:const TextInputType.numberWithOptions(
              decimal: true,
            ),
          ),
        ),
        Container(
          margin:const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.fromLTRB(20,0,20,0),
          child: TextButton(
            onPressed:convert, 
          style: TextButton.styleFrom(  
            backgroundColor:Colors.blue,
            foregroundColor:Colors.white,
            // fixedSize: MaterialStatePropertyAll(Size(double.infinity,50)),
            minimumSize:const Size(double.infinity,50),
            animationDuration:const Duration(milliseconds: 2),
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(50)
            )),
          child:const Text('Calculate',
          style: TextStyle(
            fontSize: 20
          ),
          )
          ),
        )
      ]
      ),
    ),
    ),
  );
  }
}
