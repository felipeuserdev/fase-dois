class Arguments {
  String dica;
  int ordem;
  String pergunta;
  int respostaCorreta;
  List<String>? respostas = [];
  List listaQuiz;

  Arguments({
    this.dica = '',
    this.ordem = 0,
    this.pergunta = '',
    this.respostaCorreta = 0,
    this.respostas,
    this.listaQuiz = const [],
  });
}
