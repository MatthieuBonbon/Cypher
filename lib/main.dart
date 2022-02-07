import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'parameters.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cypher",
      home: HomePage()
    );
  }
}



class HomePage extends StatelessWidget{

  double deviceRatio(BuildContext context){
    if(MediaQuery.of(context).size.aspectRatio<0.64){
      return 300;
    }
    else{
      return 150;
    }

  }

  @override
  Widget build(BuildContext context) {
    print("Device info : \n");
    print(MediaQuery.of(context).size.aspectRatio);
    print("End device info\n");
    return Scaffold(

      backgroundColor: Colors.deepPurple.shade900,
      body: Center(
        child: Column(
          children: [
            Container(

              height: deviceRatio(context),
            ),

            Container(
              padding: EdgeInsets.only(bottom: 30),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(250, 60),
                  primary: Colors.deepPurple.shade800,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  side: BorderSide(width: 2.5, color: Colors.white),
                ), // Style
                onPressed: (){
                  print('Bouton "Jouer"');
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ParameterPage();
                      },
                    ),
                  );
                },
                child: Text("Jouer",
                  style: GoogleFonts.kaushanScript(
                    fontSize: 30,
                  ),
                ),
              ),
              ),



            Container(

              padding: EdgeInsets.only(bottom: 30),

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 60),
                    primary: Colors.deepPurple.shade800,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    side: BorderSide(width: 2.5, color: Colors.white),
                  ), // Style

                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        'Règles et astuces',
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      content: const Text(
                          'Etape 1 : vous choisissez le nombre de joueurs\n'
                        + '\nEtape 2 : vous choisssez le nombre de mots par joueur\n'
                        + '\nEtape 3 : vous improvisez tous un texte contenant '
                        +     'les mots qui vous ont été attribués\n'
                        + '\nEtape 4 : vous chantez chacun votre tour vos textes respectifs '
                        +     'par dessus la boucle audio de votre choix\n'
                        + '\nA vos plumes ! 🔥📝',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  child: Text("Règles et astuces",
                    style: GoogleFonts.kaushanScript(
                      fontSize: 30,
                    ),
                  ),
            ),
            ),



            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 60),
                primary: Colors.deepPurple.shade800,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
                side: BorderSide(width: 2.5, color: Colors.white),
              ), // Style

              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                    'Crédits',
                    style: TextStyle(
                      color: Colors.deepPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  content: const Text(
                    'Avec le soutien de Rostaminho \n'
                    + '\n Boucles audios créées par\n'
                        + 'Eagle Beatz',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

                child: Text("Crédits",
                  style: GoogleFonts.kaushanScript(
                    fontSize: 30,
                  ),
                ),
              ),

          ],
        ),
      )
    );
  }
}
