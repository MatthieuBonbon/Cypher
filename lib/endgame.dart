import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'parameters.dart';
import 'main.dart';

class EndgamePage extends StatelessWidget{

  List<double> deviceRatio(BuildContext context){
    List<double> list = [];
    if(MediaQuery.of(context).size.aspectRatio<0.64){
      list.add(250);
      list.add(50);
      list.add(100);
    }
    else{
      list.add(150);
      list.add(20);
      list.add(70);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade800,
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: deviceRatio(context)[0], bottom: deviceRatio(context)[1]),
              child: Text("Félicitations ! \n \nVous êtes géniaux !",
                style: GoogleFonts.kaushanScript(
                  fontSize: 35,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: deviceRatio(context)[2]),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(250, 60),
                  primary: Colors.deepPurple.shade800,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  side: BorderSide(width: 2.5, color: Colors.white),
                ),
                child: Text("Rejouer",
                  style: GoogleFonts.kaushanScript(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: (){
                  print('bouton "Rejouer"');
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ParameterPage();
                      }
                    )
                  );
                },
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(250, 60),
                  primary: Colors.deepPurple.shade800,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  side: BorderSide(width: 2.5, color: Colors.white),
                ),
                child: Text("Menu principal",
                  style: GoogleFonts.kaushanScript(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: (){
                  print('bouton "Menu principal"');
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      }
                  )
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}