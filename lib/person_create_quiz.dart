import 'package:flutter/material.dart';

class PersonCreateQuiz extends StatefulWidget {
  @override
  _PersonCreateQuizState createState() => _PersonCreateQuizState();
}

class _PersonCreateQuizState extends State<PersonCreateQuiz> {

  Controller controller;
  bool _value;

  @override
  void initState() {
    controller = Controller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if(controller.qtdQuestions != null && (controller.questions == null || (controller.questions.length - 1) != controller.qtdQuestions)){
      controller.questions = List.generate(controller.qtdQuestions, (i) => Question());
      print(controller.questions);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz a partir de Pessoa'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * .1),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Nome retornado pela API',
                            labelText: 'Nome da pessoa'
                        ),
                        validator: (value) => value.isEmpty ? 'Digite' : null,
                        onSaved: (value){
                          controller.name = value;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: Theme(
                          data: ThemeData(
                              canvasColor: Theme.of(context).buttonColor,
                              iconTheme: IconThemeData(color: Colors.white)
                          ),
                          child: DropdownButtonFormField<int>(
                            items: controller.options.map((int item){
                              return DropdownMenuItem<int>(
                                value: item,
                                child: Text(
                                    item.toString(),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                controller.qtdQuestions = value;
                              });
                            },
                            value: controller.qtdQuestions,
                            validator: ((value) {
                              if (value != null) {
                                return null;
                              } else {
                                return "Gênero não selecionado";
                              }
                            }),
                            decoration: InputDecoration(
                              labelText: "Qtd questões",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                      controller.qtdQuestions == null ? Container()
                        : Container(
                        height: 350,
                        width: size.width *.8,
                        child: ListView.separated(
                          separatorBuilder: (context, position){
                            return SizedBox(height: 50, child: Icon(Icons.arrow_downward),);
                          },
                            itemCount: controller.qtdQuestions,
                            itemBuilder: (context, position){
                              return Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Titulo da pergunta'
                                    ),
                                    validator: (value) => value.isEmpty ? 'Digite' : null,
                                    onSaved: (value){
                                      controller.questions[position].title = value;
                                    },
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: size.width * .63,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              labelText: '1º Opção'
                                          ),
                                          validator: (value) => value.isEmpty ? 'Digite' : null,
                                        ),
                                      ),
                                      Checkbox(value: _value == null ? false : _value, onChanged: (value) {
                                        setState(() {
                                          controller.questions[position].awnsers[0].isCorrect = value;
                                        });
                                      },)
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: size.width * .63,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              labelText: '2º Opção'
                                          ),
                                          validator: (value) => value.isEmpty ? 'Digite' : null,
                                        ),
                                      ),
                                      Checkbox(value: _value == null ? false : _value, onChanged: (value) {
                                        setState(() {
                                          controller.questions[position].awnsers[1].isCorrect = value;
                                        });
                                      },)
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: size.width * .63,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              labelText: '3º Opção'
                                          ),
                                          validator: (value) => value.isEmpty ? 'Digite' : null,
                                        ),
                                      ),
                                      Checkbox(value: controller.questions[position].awnsers[2].isCorrect == null ? false : controller.questions[position].awnsers[2].isCorrect, onChanged: (value) {
                                        setState(() {
                                          controller.questions[position].awnsers[2].isCorrect = value;
                                        });
                                      },)
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: size.width * .63,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              labelText: '4º Opção'
                                          ),
                                          validator: (value) => value.isEmpty ? 'Digite' : null,
                                        ),
                                      ),
                                      Checkbox(value: _value == null ? false : _value, onChanged: (value) {
                                        setState(() {
                                          controller.questions[position].awnsers[3].isCorrect = value;
                                        });
                                      },)
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                  ),
                                ],
                              );
                            }
                        ),
                      ),
                      Container(
                        width: 150,
                        child: RaisedButton(
                          color: Colors.green,
                          onPressed: (){
                            print(controller.validate());
                          },
                          child: Text('Salvar', style: TextStyle(color: Colors.white),),
                        ),
                      )
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Controller{
  var formKey = GlobalKey<FormState>();
  List<int> options = [1,2,3,4];
  String name;
  int qtdQuestions;
  List<Question> questions;

  bool validate() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }
}

class Quiz{
  String idTvShow;
  final String photoUrl = 'https://firebasestorage.googleapis.com/v0/b/dod-tv-digital.appspot.com/o/images%2Ftaligado-1x1.png?alt=media&token=ac11774c-e168-4762-b4de-212d701b9242';
  final String title = 'Quiz';
  final String description = '';
  final String users = '';

  toMap(){
    Map map = Map();
    map['ididTvShow'] = this.idTvShow;
    map['photoUrl'] = this.photoUrl;
    map['title'] = this.title;
    map['description'] = this.description;
    map['users'] = this.users;

    return map;
  }
}

class Question{
  String title;
  List<Awnsers> awnsers;
  String idQuiz;
  final int type = 0;

  Question(){
    this.awnsers = List.generate(4, (i) => Awnsers());
  }

  toMap(){
    Map map = Map();

    List listAwnsers;
    this.awnsers.forEach((a){
      listAwnsers.add(a.toMap());
    });

    map['title'] = this.title;
    map['awnsers'] = this.awnsers;
    map['idQuiz'] = this.idQuiz;
    map['type'] = this.type;

    return map;
  }
}

class Awnsers{
  String question;
  bool isCorrect;
  final int value = 0;

  toMap(){
    Map map = Map();
    map['question'] = this.question;
    map['isCorrect'] = this.isCorrect;
    map['value'] = this.value;

    return map;
  }
}