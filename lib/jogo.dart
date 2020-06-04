import 'dart:math';

import 'package:flutter/material.dart';


class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opcao abaixo";

  void _opcaoSelecionada(String escolhaUser){
    
    var opcao = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt( opcao.length );
    var escolhaApp = opcao[numero];

    print("Escolha do App $escolhaApp");
    print("Escolha do User $escolhaUser");

    switch ( escolhaApp ) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
        case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
        case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
      default:
    }

    if (
      (escolhaUser == "pedra"   && escolhaApp == "tesoura") ||
      (escolhaUser == "tesoura" && escolhaApp == "papel") ||
      (escolhaUser == "pepel"   && escolhaApp == "pedra")
    ) {
      setState(() {
        this._mensagem = "Você Ganhou";
      });
    }else if (
      (escolhaApp == "pedra"   && escolhaUser == "tesoura") ||
      (escolhaApp == "tesoura" && escolhaUser == "papel") ||
      (escolhaApp == "pepel"   && escolhaUser == "pedra")
    ) {
      setState(() {
        this._mensagem = "Você Perdeu";
      });
    }else{
      setState(() {
        this._mensagem = "empate";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JoKenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16), 
            child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
          ),
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}