import 'package:fase_dois/components/button_nivel.dart';
import 'package:fase_dois/models/api.dart';
import 'package:fase_dois/variables/variables.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class CardCustom extends StatefulWidget {
  int? nivel;
  CardCustom({super.key, this.nivel});

  @override
  State<CardCustom> createState() => _CardCustomState();
}

bool isTapButton = true;

class _CardCustomState extends State<CardCustom> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getInfo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: MediaQuery.of(context).size.width > 620
                ? 380
                : MediaQuery.of(context).size.width - 16,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: colorWhite,
                    border: Border.all(
                      width: 5,
                      color: colorBlack,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    collapsedIconColor: colorBlack,
                    iconColor: colorBlack,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ESTAGIÁRIO',
                          style: TextStyle(
                              color: colorBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          '0%',
                          style: TextStyle(
                              color: colorBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              height: 400,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 24, bottom: 24),
                                child: Image.asset(
                                  'lib/assets/images/line_progressing.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            //retirar essa Padding
                            child: Column(
                              children: [
                                ButtonNivel(
                                  leftorRight: MainAxisAlignment.start,
                                  title: snapshot.data![index]['nivel'][0]
                                      ['icon'],
                                  numeroQuiz: 0,
                                  indexNivel: index,
                                ),
                                ButtonNivel(
                                  title: snapshot.data![index]['nivel'][1]
                                      ['icon'],
                                  numeroQuiz: 1,
                                  indexNivel: index,
                                ),
                                ButtonNivel(
                                  leftorRight: MainAxisAlignment.start,
                                  title: snapshot.data![index]['nivel'][2]
                                      ['icon'],
                                  numeroQuiz: 2,
                                  indexNivel: index,
                                ),
                                ButtonNivel(
                                  title: snapshot.data![index]['nivel'][3]
                                      ['icon'],
                                  numeroQuiz: 3,
                                  indexNivel: index,
                                ),
                                ButtonNivel(
                                  leftorRight: MainAxisAlignment.start,
                                  title: snapshot.data![index]['nivel'][4]
                                      ['icon'],
                                  numeroQuiz: 4,
                                  indexNivel: index,
                                ),
                                ButtonNivel(
                                  title: snapshot.data![index]['nivel'][5]
                                      ['icon'],
                                  numeroQuiz: 5,
                                  indexNivel: index,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('data');
        }
        return Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              strokeWidth: 8,
              color: colorGreen,
            ),
          ),
        );
      },
    );
  }
}
