import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String choiceHead;
  final String choiceDetail;
  final String correctAnswer;

  const ChoiceButton({
    super.key,
    required this.choiceHead,
    required this.choiceDetail,
    required this.correctAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: correctAnswer == choiceHead ? Colors.tealAccent : Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: correctAnswer == choiceHead ? Colors.redAccent : Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(),
              ),
              child: Center(
                child: Text(
                  choiceHead,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Text(choiceDetail),
          correctAnswer == choiceHead
              ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(IconData(
                  0xe156,
                  fontFamily: 'MaterialIcons',
                )),
              )
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                )
        ],
      ),
    );
  }
}
