import 'dart:developer';
import 'package:fase_dois/components/background_custom.dart';
import 'package:fase_dois/components/button_custom.dart';
import 'package:fase_dois/components/button_edit.dart';
import 'package:fase_dois/components/button_home.dart';
import 'package:fase_dois/models/arguments.dart';
import 'package:fase_dois/variables/variables.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _Quiz();
}

int indexPergunta = 0;
bool confirm = false;
Map<int, bool> idx = {
  0: false,
  1: false,
  2: false,
  3: false,
};

class _Quiz extends State<Quiz> {
  //nção sei o que to fazendo aqui ainda

  //ignorar

  @override
  Widget build(BuildContext context) {
    log('build a tela quiz');
    var size = MediaQuery.of(context).size.width;
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorBlack,
          title:
              Text('QUIZ', style: TextStyle(fontSize: 28, color: colorWhite)),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            const BackgroundCustom(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //barra de progresso para fazer
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        width: size,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: colorWhite,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: indexPergunta + 1 == 1 ? size / 2 : size / 1,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: colorYellow,
                        ),
                      ),
                    ],
                  ),
                ),
                //fim da Barra de progresso

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pergunta nº: ${indexPergunta + 1} de ${args.listaQuiz.length}',
                      style: TextStyle(
                        color: colorWhite,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
                //
                //tela verde das perguntas
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width - 32,
                  decoration: BoxDecoration(
                    color: colorYellow,
                    border: Border.all(width: 5, color: colorBlack),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.asset('lib/assets/images/glass.png',
                            fit: BoxFit.fill),
                      ),
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(24),
                        child: Text(args.listaQuiz[indexPergunta]['pergunta'],
                            //pergunta do quiz
                            style: TextStyle(
                                letterSpacing: 0,
                                wordSpacing: 0,
                                fontSize: 18,
                                color: colorBlack,
                                fontFamily: '',
                                fontWeight: FontWeight.w700)),
                      ),
                      Positioned(
                          bottom: 16,
                          right: 16,
                          width: 40,
                          height: 40,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    alignment: Alignment.center,
                                    elevation: 2,
                                    insetPadding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 24),
                                    backgroundColor: Colors.transparent,
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: colorWhite,
                                      ),
                                      child: SingleChildScrollView(
                                        child: Text(
                                            args.listaQuiz[indexPergunta]
                                                ['pergunta'],
                                            style: TextStyle(
                                                letterSpacing: 0.1,
                                                wordSpacing: 0.1,
                                                fontSize: 18,
                                                color: colorBlack,
                                                fontFamily: '',
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.crop_free_sharp,
                              size: 40,
                              color: colorBlack,
                              shadows: [
                                BoxShadow(
                                  blurRadius: 6,
                                  color: colorLight,
                                )
                              ],
                            ),
                          )),
                      Positioned(
                        bottom: 56,
                        child: ElevatedButton(
                            onPressed: () {
                              log({indexPergunta + 1}.toString());

                              setState(() {
                                idx.updateAll((key, value) => false);
                                if (indexPergunta < args.listaQuiz.length - 1) {
                                  indexPergunta++;
                                } else {
                                  indexPergunta = 0;
                                }
                              });
                            },
                            child: const Text('avançar')),
                      ),
                    ],
                  ),
                ),

                // ButtonCustom(
                //   title: args.listaQuiz[indexPergunta]['respostas'][0],
                //   color: colorWhite,
                //   check: false,
                //   indexButton: 0,
                // ),
                // ButtonCustom(
                //   title: args.listaQuiz[indexPergunta]['respostas'][1],
                //   color: colorWhite,
                //   check: false,
                //   indexButton: 1,
                // ),
                // ButtonCustom(
                //   title: args.listaQuiz[indexPergunta]['respostas'][2],
                //   color: colorWhite,
                //   check: false,
                //   indexButton: 2,
                // ),
                // ButtonCustom(
                //   title: args.listaQuiz[indexPergunta]['respostas'][3],
                //   color: colorWhite,
                //   check: false,
                //   indexButton: 3,
                // ),
                ListButton(
                  resp1: args.listaQuiz[indexPergunta]['respostas'][0],
                  resp2: args.listaQuiz[indexPergunta]['respostas'][1],
                  resp3: args.listaQuiz[indexPergunta]['respostas'][2],
                  resp4: args.listaQuiz[indexPergunta]['respostas'][3],
                )
              ],
            ),
          ],
        ));
  }
}

//uma animação inicial e ela já vai direto pra pagina de niveis.
//passando os argumentos e usando o future = getInfo().
//armazenar essa lista em uma variavel.
//assim só vai ser necessário carregar uma vez só, ao iniciar o app

//ignore: must_be_immutable
class ListButton extends StatefulWidget {
  String resp1;
  String resp2;
  String resp3;
  String resp4;
  ListButton(
      {super.key,
      required this.resp1,
      required this.resp2,
      required this.resp3,
      required this.resp4});

  @override
  State<ListButton> createState() => _ListButtonState();
}

class _ListButtonState extends State<ListButton> {
  confirm(int n) {
    setState(() {
      //tentar salvar um index para cada um e fazer um "if"
      //pra saber qual deve alterado

      if (idx[n] == false) {
        idx.updateAll((key, value) => false);
        idx.update(n, (value) => true);
      }
      log(idx.toString());
    });
    log('O botão é: ${idx[n]}');
    return idx[n];
  }

  @override
  Widget build(BuildContext context) {
    log('buildou');
    return Column(
      children: [
        GestureDetector(
          onTap: (() {
            confirm(0);
          }),
          child: ButtonCustom(
            title: widget.resp1,
            color: colorWhite,
            check: idx[0]!,
            isPress: !idx[0]!,
            indexButton: 0,
          ),
        ),
        GestureDetector(
          onTap: (() {
            confirm(1);
          }),
          child: ButtonCustom(
            title: widget.resp2,
            color: colorWhite,
            check: idx[1]!,
            isPress: !idx[1]!,
            indexButton: 1,
          ),
        ),
        GestureDetector(
          onTap: (() {
            confirm(2);
          }),
          child: ButtonCustom(
            title: widget.resp3,
            color: colorWhite,
            check: idx[2]!,
            isPress: !idx[2]!,
            indexButton: 2,
          ),
        ),
        GestureDetector(
          onTap: (() {
            confirm(3);
          }),
          child: ButtonCustom(
            title: widget.resp4,
            color: colorWhite,
            check: idx[3]!,
            isPress: !idx[3]!,
            indexButton: 3,
          ),
        ),
        idx.containsValue(true)
            ? ButtonEdit(
                title: 'CONFIRMAR',
                check: true,
              )
            : const Text(''),
      ],
    );
  }
}
