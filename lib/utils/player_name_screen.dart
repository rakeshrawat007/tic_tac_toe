import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe_2022/main.dart';
import 'package:tic_tac_toe_2022/ui/theme/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2022/utils/validation_mixin.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class PlayerNameScreen extends StatefulWidget {
  @override
  _PlayerNameScreenState createState() => _PlayerNameScreenState();
}

class _PlayerNameScreenState extends State<PlayerNameScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstname = TextEditingController();
  TextEditingController secondname = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool rememberpwd = false;
  bool sec = true;
  var visable = Icon(
    Icons.visibility,
    color: Color(0xff4c5166),
  );
  var visableoff = Icon(
    Icons.visibility_off,
    color: Color(0xff4c5166),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212628),
      body: Container(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'lib/assets/logo.png',
                    height: 150,
                    width: 200,
                  ),
                  buildTictactoetext(),
                  SizedBox(
                    height: 50,
                  ),
                  buildFirstName(),
                  SizedBox(
                    height: 50,
                  ),
                  buildSecondName(),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildLoginButton(context),
                ]),
          ),
        ),
      ),
    );
  }

  Widget buildTictactoetext() {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 25.0,
      fontFamily: 'Horizon',
    );
    return AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText('Tic Tac Toe',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
            speed: Duration(seconds: 1)),
      ],
      isRepeatingAnimation: true,
      repeatForever: true,
      onTap: () {
        print("Tap Event");
      },
    );
  }

  Widget buildFirstName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Player First",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xffebefff),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
          ),
          height: 60,
          child: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            controller: firstname,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Name Cannot be Empty';
              } else {
                if (value.length > 15) {
                  return 'Name is Too Long';
                }
              }
            },
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 12),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10),
                  child: FaIcon(
                    FontAwesomeIcons.user,
                    color: Color(0xffFFD900),
                  ),
                ),
                hintText: "Enter Name",
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildSecondName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Player Second",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xffebefff),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
          ),
          height: 60,
          child: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            controller: secondname,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Name Cannot be Empty';
              } else {
                if (value.length > 15) {
                  return 'Name is Too Long';
                }
              }
            },
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: "Enter Name",
              hintStyle: TextStyle(color: Colors.black38),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 12.0),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10),
                child: FaIcon(
                  FontAwesomeIcons.user,
                  color: Color(0xffFA5C0C),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Container(
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Get.to(GameScreen(
                firstname: firstname.text,
                secondname: secondname.text,
              ));
            }
          },
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Color(0xff3c6970),
          padding: EdgeInsets.all(15),
          child: Text(
            "Start The Game",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
