import 'package:create_quiz/person_create_quiz.dart';
import 'package:create_quiz/program_create_quiz.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Quiz'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProgramCreateQuiz()));
              },
              child: Text('Criar quiz de programa'),
            ),
            SizedBox(height: 20,),
            RaisedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonCreateQuiz()));
              },
              child: Text('Criar quiz a partir de pessoa'),
            ),
          ],
        ),
      ),
    );
  }
}
