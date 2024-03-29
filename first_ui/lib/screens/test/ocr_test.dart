/*

import 'package:flutter/material.dart';
import 'package:firebase_mlkit_language/firebase_mlkit_language.dart';


// Coming soon page for multi-purpose

class OcrTesting extends StatefulWidget {
  @override
  _OcrTesting createState() => new _OcrTesting();
}




class _OcrTesting extends State<OcrTesting> {



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    inputTextController.dispose();
    super.dispose();
  }

  final inputTextController = TextEditingController();

  var translatedText = "Translated Text";
  var inputText;
  var identifiedLang = "Detected Language";

  void onPressed() async {
    inputText = inputTextController.text;
    var result = await FirebaseLanguage.instance
        .languageTranslator(
        SupportedLanguages.English, SupportedLanguages.Spanish)
        .processText(inputText);
    setState(() {
      translatedText = result;
    });
  }

  void onPoked() async {
    inputText = inputTextController.text;
    var result = await FirebaseLanguage.instance
        .languageIdentifier()
        .processText(inputText);

    setState(() {
      identifiedLang = result[0].languageCode; //returns most probable
    });
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(21, 24, 45,
              1.0), //Color(0xff202a30), //Colors.black87, // Color(0xFF5986E1),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'images/ComicSpa_logo.png',
                width: 88,
                height: 21.25,
              ),
              Padding(padding: const EdgeInsets.only(left: 8.0)),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(Icons.perm_identity),
            ),

            Padding(
              //Todo If search feature goes to bottomAppBar delete this padding
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Image.asset(
                'images/search.png',
                width: 21.5,
                height: 18.5,
              ),
            ),
          ],
        ),
      ),
        body: new Container(
          padding: EdgeInsets.all(50),
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(controller: inputTextController),
                new SizedBox(height: 50),
                new RaisedButton(
                    child: new Text("Translate",
                        style: TextStyle(color: Colors.white)),
                    color: Colors.blue,
                    onPressed: onPressed),
                new SizedBox(height: 25),
                new Container(
                  padding: EdgeInsets.all(20),
                  child: new SizedBox(
                      child: new Text(translatedText), height: 20),
                  decoration: new BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                  ),
                ),
                new SizedBox(height: 20),
                new RaisedButton(
                    child: new Text("Identify Language",
                        style: TextStyle(color: Colors.white)),
                    color: Colors.blue,
                    onPressed: onPoked),
                new SizedBox(height: 25),
                new Container(
                  padding: EdgeInsets.all(10),
                  child: new Text(identifiedLang),
                  decoration: new BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
*/