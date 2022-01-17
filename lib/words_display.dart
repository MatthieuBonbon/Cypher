import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file/file.dart';
import 'dart:math';
import 'music_display.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;


class Words extends StatefulWidget{

  List<String> array = [];

  bool generated = false;

  final nbWord;
  final nbPlayer;

  Words({Key? key, this.nbWord, this.nbPlayer}) : super(key: key);

  @override
  WordsState createState() => WordsState();
}




class WordsState extends State<Words>{

  List arrayGenerator (int nbWord, int nbPlayer, List<String> wordDatabase){
    List globalArray = [];      // array who contains the words
    List indexArray = [];     // array who contains the index of words from wordDatabase

    for(int i = 0; i < nbPlayer; i++){      // for every player
      print( "nb of player : " + i.toString() );

      // step 1 : create a wordPerPlayerArray
      List wordPerPlayerArray = [];

      for(int j = 0; j < nbWord; j++){    // for every word
        print("nb of word : " + j.toString() );

        int uniqueIndex = uniqueRandomNumber(indexArray, widget.array);
        // step 2 : feed the wordPerPlayerArray
        wordPerPlayerArray.add(widget.array[uniqueIndex]);
        // step 2bis : add the index of the random selected word in indexArray
        indexArray.add(uniqueIndex);
      }

      // step 3 : add wordPerPlayerArray in globalArray
      globalArray.add(wordPerPlayerArray);
    }

    print("global array from arrayGenerator : \n");
    print(globalArray);
    return globalArray;
  }

  void generateWordsDB() async{
    final String words = await rootBundle.loadString('assets/dictionary/title.txt');

    List<String> parts = words.split("\n");

    print("nombre de mots : " + parts.length.toString());

    setState(() {
      widget.generated=true;
      widget.array=parts;
    });
  }


  int uniqueRandomNumber(List array, List wordArray){
    var rand = new Random();
    int randInt = rand.nextInt(wordArray.length);
    while (array.contains(randInt)){
      randInt = rand.nextInt(wordArray.length);
    }
    return randInt;
  }


  /// Word Container List

  List<Widget> wordContainerList(){

    List<Widget> containerList = [];

    if(widget.generated==false){
      print("La db n'est pas encore générée : " + widget.generated.toString());
      containerList.add(
        Container(
          child: Text("Chargement ...",
            style: GoogleFonts.kaushanScript(
              fontSize: 35,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        )
      );
      return containerList;
    }
    else {
      print("La db est générée : " + widget.generated.toString());
      List wordArray = arrayGenerator(
          widget.nbWord.round(), widget.nbPlayer, widget.array);

      containerList.add(
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text("Mots attribués aux joueurs",
              style: GoogleFonts.kaushanScript(
                fontSize: 35,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          )
      );

      for (int i = 0; i < widget.nbPlayer; i++) {
        containerList.add(wordContainer(i + 1, wordArray[i]));
      }


      containerList.add( // btn container
        Container(
          margin: EdgeInsets.only(top: 40, bottom: 50),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(250, 60),
              primary: Colors.deepPurple.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              side: BorderSide(width: 2.5, color: Colors.white),
            ),
            onPressed: () {
              print("Bouton 'Continuer'");
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Music();
                },
              ),
              );
            },
            child: Text("Continuer",
              style: GoogleFonts.kaushanScript(
                fontSize: 35,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

      return containerList;
    }
  }


  /// End Word Container List


  Container wordContainer(int a, List wordArray){
    print("player : " + a.toString() + " words : " + wordArray.toString());
    String words = "";
    for(int i = 0; i < wordArray.length; i++){
      print("word " + i.toString() + " : " + wordArray[i] );
      words+= "\n " + wordArray[i];
    }
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: 240.0,

      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.white,
            width: 5,
          ),
          color: Colors.deepPurple.shade500,
        ),

        child: Text("Joueur "+a.toString() + "\n -----------" + words,
          style: GoogleFonts.kaushanScript(
            fontSize: 30,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    if(widget.generated==false)
      generateWordsDB();

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade800,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: wordContainerList(),
          ),
        ),
      ),
    );
  }

}