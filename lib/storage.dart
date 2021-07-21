import 'package:quizkaro/question.dart';

class Storage{
  int _qno=0;
  List<Question> queans=[
    Question("1 > 2", false),
    Question("1 == 2", false),
    Question("1 < 2", true),
    Question("4*2=8?",true ),
    Question("2+4=5?", false),
  ];
  void nextQues() {
    if (_qno <queans.length - 1) {
      _qno++;
    }
  }

  String guesOnly(){
    return queans[_qno].question;
  }
bool ansOnly(){
    return queans[_qno].answer;
}
  bool isFinished() {
    if (_qno >=queans.length -1){
      return true;}
    else{
      return false;
  }
  }

  void reset(){
    _qno=0;
  }

}