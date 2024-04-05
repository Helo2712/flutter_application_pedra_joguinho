import 'dart:math';
import 'package:flutter/material.dart';

class Pedra_p_t extends StatefulWidget {
  const Pedra_p_t({Key? key}) : super(key: key);

  @override
  State<Pedra_p_t> createState() => _Pedra_p_tState();
}

class _Pedra_p_tState extends State<Pedra_p_t> {
  final List<String> options = ['Pedra', 'Papel', 'Tesoura'];
  String result = "";
  String playerChoice = "";
  String computerChoice = "";
  String computerImagePath = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Joguinho",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 162, 138, 228),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Escolha do APP:",
                style: TextStyle(fontSize: 20,),
              ),
              SizedBox(height: 10),
              Image.asset(computerImagePath, height: 100, width: 100),
              SizedBox(height: 20),
              Text(
                "Escolha uma das opções abaixo:",
                style: TextStyle(fontSize: 20,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Image.asset("assets/images/pedra.png", height: 100, width: 100),
                    onTap: () => _onOptionSelected('Pedra'),
                  ),
                  GestureDetector(
                    child: Image.asset("assets/images/papel.png", height: 100, width: 100),
                    onTap: () => _onOptionSelected('Papel'),
                  ),
                  GestureDetector(
                    child: Image.asset("assets/images/tesoura.png", height: 100, width: 100),
                    onTap: () => _onOptionSelected('Tesoura'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(result, style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text("Sua escolha: $playerChoice", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text("Escolha do computador: $computerChoice", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  void _onOptionSelected(String choice) {
    setState(() {
      playerChoice = choice;
      computerChoice = options[Random().nextInt(3)];
      result = _calculateResult(playerChoice, computerChoice);
      computerImagePath = _getImagePath(computerChoice);
    });
  }

  String _calculateResult(String player, String computer) {
    if (player == computer) {
      return "EMPATE!";
    } else if ((player == 'Pedra' && computer == 'Tesoura') ||
        (player == 'Papel' && computer == 'Pedra') ||
        (player == 'Tesoura' && computer == 'Papel')) {
      return "Você GANHOU!";
    } else {
      return "Você PERDEU!";
    }
  }

  String _getImagePath(String choice) {
    switch (choice) {
      case 'Pedra':
        return 'assets/images/pedra.png';
      case 'Papel':
        return 'assets/images/papel.png';
      case 'Tesoura':
        return 'assets/images/tesoura.png';
      default:
        return '';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: Pedra_p_t(),
  ));
}
