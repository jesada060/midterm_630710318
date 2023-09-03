// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:cpsu_midterm_1_2023_starter/widgets/choice_button.dart';

// TODO: ใส่รหัสนักศึกษาที่ค่าสตริงนี้
const studentId = '630710318';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> _questionList = [
    'What is the capital of France?',
    'Who wrote the Play \'Romeo and Juliet\'?',
    'What is the longest river in the world?',
  ];

  static const List<String> _choiceAList = [
    'Berlin',
    'Charles Dickens',
    'Amazon River',
  ];

  static const List<String> _choiceBList = [
    'London',
    'William Shakespeare', // This choice is correct.
    'Nile River', // This choice is corrent.
  ];

  static const List<String> _choiceCList = [
    'Madrid',
    'Mark Twain',
    'Mississippi River',
  ];

  static const List<String> _choiceDList = [
    'Paris', // This choice is correct.
    'Jane Austen',
    'Yangtze River',
  ];

  static const List<String> _correctAnsList = [
    'D',
    'B',
    'B',
  ];

  var index = 0;

  void handleClickNext() {}

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_colorful.jpg"),
              opacity: 0.6,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Good Morning',
                  textAlign: TextAlign.center, style: textTheme.headlineMedium),
              Text(studentId,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
              Spacer(),
              _buildQuizView(),
              Spacer(),
              _buildButtonPanel(),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  _buildQuizView() {
    // TODO: build UI
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Question ${index + 1} of 3',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.rectangle,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    _questionList[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChoiceButton(
                choiceHead: 'A',
                choiceDetail: _choiceAList[index],
                correctAnswer: _correctAnsList[index],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChoiceButton(
                choiceHead: 'B',
                choiceDetail: _choiceBList[index],
                correctAnswer: _correctAnsList[index],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChoiceButton(
                choiceHead: 'C',
                choiceDetail: _choiceCList[index],
                correctAnswer: _correctAnsList[index],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChoiceButton(
                choiceHead: 'D',
                choiceDetail: _choiceDList[index],
                correctAnswer: _correctAnsList[index],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildButtonPanel() {
    // TODO: build UI
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 250,
              height: 30,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    (--index);
                  });
                },
                backgroundColor: Colors.redAccent,

                shape: Border.all(),
                child: Text(
                  '<',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 250,
              height: 30,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    index = (++index) % 3;
                  });
                },
                backgroundColor: Colors.teal,
                shape: Border.all(),
                child: Text(
                  '>',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
