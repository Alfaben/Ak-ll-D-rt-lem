import 'package:flutter/material.dart';

import 'QuizScreen.dart';

class QuizQuestionScreen extends StatefulWidget {
  final IconData icon;
  final operator;

  QuizQuestionScreen({Key key, this.icon, this.operator}) : super(key: key);

  @override
  _QuizQuestionScreenState createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ques = TextEditingController();

  final TextEditingController _range1 = TextEditingController();

  final TextEditingController _range2 = TextEditingController();
  // InterstitialAd myInterstitial;
  // MobileAdTargetingInfo targetingInfo;
  @override
  void initState() {
    /*targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['maths', 'education', 'school', 'college', 'study'],
      contentUrl: 'https://flutter.io',
      birthday: DateTime.now(),
      childDirected: false,
      designedForFamilies: false,
      gender: MobileAdGender.unknown,
      testDevices: <String>[], // Android emulators are considered test devices
    );
    myInterstitial = InterstitialAd(
      adUnitId: "ca-app-pub-8093789261096390/8369331109",
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );*/
    return Scaffold(
      backgroundColor: Colors.pink[600],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "akıllı dört işlem",
          style:
              TextStyle(color: Colors.pink[600], fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          physics: ScrollPhysics(parent: ScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Hero(
                tag: widget.icon,
                child: Icon(
                  widget.icon,
                  size: 70,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MainScreenCard(
                      ques: _ques,
                      icon: widget.icon,
                      max: 3,
                      hint: "Kaç Tane Soru Olsun ?",
                      maxValue: 100,
                    ),
                    MainScreenCard(
                      ques: _range1,
                      icon: widget.icon,
                      max: 5,
                      hint: "İlk Sayı Üst Değeri",
                    ),
                    MainScreenCard(
                      ques: _range2,
                      icon: widget.icon,
                      max: 5,
                      hint: "İkinci Sayı Üst Değeri",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(
                          oprator: widget.operator,
                          numOfQuestions: _ques.text,
                          range1: _range1.text,
                          range2: _range2.text,
                        ),
                      ),
                    );
                  }
                },
                elevation: 10,
                color: Colors.yellow[400],
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "BAŞLA",
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreenCard extends StatelessWidget {
  const MainScreenCard({
    Key key,
    @required TextEditingController ques,
    @required this.icon,
    this.hint,
    this.max,
    this.maxValue = 999999,
  })  : _ques = ques,
        super(key: key);

  final TextEditingController _ques;
  final IconData icon;
  final String hint;
  final int max;
  final int maxValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        controller: _ques,
        keyboardType: TextInputType.number,
        validator: (val) {
          if (val.isEmpty) {
            return "Lütfen Boş Bırakmayınız";
          } else if (int.parse(val) < 2) {
            return "";
          } else if (int.parse(val) > maxValue) {
            return "Tek seferde en fazla 100 soru oluşturulur";
          }
          return null;
        },
        style: TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.white),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(16),
          ),
          labelText: hint,
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(icon),
          hintStyle: TextStyle(color: Colors.black),
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
