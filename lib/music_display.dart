import 'package:cypher_v2/endgame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assets_audio_player/assets_audio_player.dart';


class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {

  final assetsAudioPlayer = AssetsAudioPlayer();


  List<Widget> musicContainerList(){
    List<Widget> containerList = [];

    for(int i = 0; i < 5; i++) {
      containerList.add(musicContainer(i));
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
          onPressed: (){
            print("Bouton 'Continuer'");
            assetsAudioPlayer.stop();
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return EndgamePage();
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


  void playMusic(String audioName){
    if(assetsAudioPlayer.isPlaying.value){
      print("Stop playing previous audio.");
      assetsAudioPlayer.stop();
    }
    print("Play "+audioName);
    assetsAudioPlayer.open(
      Audio("assets/audios/"+audioName+".mp3"),
      loopMode: LoopMode.single,
    );
  }

  String musicTitleType(int audioNumber){
    switch (audioNumber){
      case 0:
        return "Pop";
      case 1:
        return "Rock";
      case 2:
        return "R&B";
      case 3:
        return "Trap";
      default:
        return "Boom Bap";
    }
  }

  Container musicContainer(int audioNumber){
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: 280,
      height: 100,

      child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurple.shade600,
              border: Border.all(
                color: Colors.white,
                width: 5,
              )
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  musicTitleType(audioNumber),
                  style: GoogleFonts.kaushanScript(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      shadowColor: Color(0x00000000),
                      primary: Color(0x00000000),
                    ),

                    onPressed: (){
                      print("Button play music");
                      playMusic(musicTitleType(audioNumber));
                    },

                    child: Icon(
                      Icons.play_circle_outline,
                      color:  Colors.white,
                      size: 50,
                    )
                ),
              )
            ],
          )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade800,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: musicContainerList(),
          ),
        ),
      ),
    );
  }

}

