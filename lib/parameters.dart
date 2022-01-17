import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'words_display.dart';


class ParameterPage extends StatefulWidget{

  @override
  ParameterPageState createState() => ParameterPageState();
}

class ParameterPageState extends State<ParameterPage>{

  // ignore: non_constant_identifier_names
  int nb_players = 2;
  // ignore: non_constant_identifier_names
  double nb_words = 3;

  double deviceRatio(BuildContext context){
    if(MediaQuery.of(context).size.aspectRatio<0.64){
      return 300;
    }
    else{
      return 150;
    }

  }

  void modifyNbPlayer(bool add){
    setState(() {
      /*
      If bool is true -> we increment the counter
      else we decrement the counter
      */
      if(add){
        if(nb_players<10){
          nb_players++;
          print("nb of players : $nb_players");
        }
      }
      else{
        if(nb_players>2){
          nb_players--;
          print("nb of players : $nb_players");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: Center(
       child: SingleChildScrollView(
         child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 100, bottom: 50),
              child: Text("Nombre de joueurs",
                style: GoogleFonts.kaushanScript(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
            ),

            Row(
              children: [

                Container(
                  width: 58,
                ),

                ElevatedButton( // button -
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(80,80),
                    primary: Colors.deepPurple.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    side: BorderSide(width: 5.0, color: Colors.white),
                  ),
                  onPressed: (){
                    print("Bouton -");
                    modifyNbPlayer(false);
                  },
                  child: Text("-",
                  style: TextStyle(
                    fontSize: 60,
                  ),
                  ),
                ),

                Container(
                  width: 20,
                ),

                Container( // container nb joueurs
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade800,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 5.0,
                    )
                  ),
                  child: Text(nb_players.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Container(
                  width: 20,
                ),

                ElevatedButton( // button +
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(80,80),
                    primary: Colors.deepPurple.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    side: BorderSide(width: 5.0, color: Colors.white),
                  ),
                  onPressed: (){
                    print("Bouton +");
                    modifyNbPlayer(true);
                  },
                  child: Text("+",
                    style: TextStyle(
                      fontSize: 60,
                    ),
                  ),
                ),
              ],
            ),

            Container(
              height: 120,
            ),

            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Text("Nombre de mots"+ "\n" + "par joueur",
                style: GoogleFonts.kaushanScript(
                  fontSize: 35,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Container( // slider
              //padding: EdgeInsets.only(top: 30),
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SliderTheme(
                data: SliderThemeData(
                  thumbColor: Colors.deepPurple.shade500,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14),
                  overlayColor: Colors.white38,
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 18),
                  valueIndicatorColor: Colors.deepPurple,
                  valueIndicatorTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                  inactiveTrackColor: Colors.deepPurple.shade200,
                  activeTrackColor:Colors.deepPurple.shade300,
                  inactiveTickMarkColor: Colors.deepPurple.shade200,
                  activeTickMarkColor: Colors.deepPurple.shade300,
                ),
                child: Slider(
                    min: 3,
                    max: 5,
                    divisions: 2,
                    label: (nb_words.toInt()).toString(),
                    value: nb_words,
                    onChanged: (double value) {
                      setState(() {
                        nb_words = value;
                        print('nb of words : '+'$nb_words');
                      });
                    }
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(250, 60),
                  primary: Colors.deepPurple.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  side: BorderSide(width: 2.5, color: Colors.white),
                ),
                onPressed: (){
                  print("Bouton 'Continuer'");
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Words(nbPlayer: nb_players, nbWord: nb_words,)
                     /* {
                        return EndgamePage();
                      } */
                      ,
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

          ],
      ),
       ),
      )
    );
  }
}