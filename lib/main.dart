import 'package:flutter/material.dart';

// 這是整個 App 的起點
void main() {
  runApp(const CalculatorApp());
}

// 這是 App 的外觀主題設定
class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我的計算機',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorHome(),
    );
  }
}

// 這是計算機的主畫面 (StatefulWidget 代表它的畫面是會改變的)
class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _output = "0"; // 顯示在螢幕上的文字

  // 當按鈕被按下時會執行的邏輯
  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0"; // 清除
      } else if (buttonText == "=") {
        _output = "太難了算不出來"; // 這裡先做個趣味回覆，後續你可以加入真正的加減乘除邏輯
      } else {
        if (_output == "0" || _output == "太難了算不出來") {
          _output = buttonText;
        } else {
          _output += buttonText; // 把數字接在後面
        }
      }
    });
  }

  // 製作按鈕的小工具
  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24.0),
          ),
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // 開始畫畫面
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter 簡易計算機')),
      body: Column(
        children: <Widget>[
          // 顯示結果的區域
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _output,
              style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(child: Divider()), // 一條分隔線
          // 數字按鈕區域
          Column(
            children: [
              Row(children: [_buildButton("7"), _buildButton("8"), _buildButton("9"), _buildButton("/")]),
              Row(children: [_buildButton("4"), _buildButton("5"), _buildButton("6"), _buildButton("*")]),
              Row(children: [_buildButton("1"), _buildButton("2"), _buildButton("3"), _buildButton("-")]),
              Row(children: [_buildButton("C"), _buildButton("0"), _buildButton("="), _buildButton("+")]),
            ],
          )
        ],
      ),
    );
  }
}