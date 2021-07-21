import 'package:flutter/material.dart';
import 'package:quizkaro/question.dart';
import 'package:quizkaro/storage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(" QuizKaro ",),
      ),
      backgroundColor: Colors.grey[900],
      body: QuizKaro(),
    ),
  ));
}
class QuizKaro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: QuizPage(),
      ),
    );
  }
}
class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}
Storage storage=Storage();
class _QuizPageState extends State<QuizPage> {
    int count=0;
    List<Icon> score = [];
    void checkans(bool selectedans){
      bool ans=storage.ansOnly();
      if(storage.isFinished()){
        Alert(
            context: context,
            title: "Quiz Score= $count",
            desc: "You've completed the quiz.")
            .show();
        storage.reset();
        score.clear();
      }else{
      setState(() {
        if(selectedans==ans) {
          count++;
          score.add(
            Icon(
                Icons.check,
              color: Colors.green,
            ),
          );
        }else{
          score.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        storage.nextQues();
        });
    }}
    
    
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                storage.guesOnly(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(

              textColor: Colors.white,
              color: Colors.green,
              onPressed: () {
                checkans(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
               onPressed: () {
                checkans(false);
               },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: score,
        ),
      ],
    );
  }
}


