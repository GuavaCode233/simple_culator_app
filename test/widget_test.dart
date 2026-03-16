// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// 注意：這裡的 simple_culator_app 必須和你專案的名稱一致 (看你原先的程式碼就是這個)
import 'package:simple_culator_app/main.dart';

void main() {
  testWidgets('計算機基本點擊測試', (WidgetTester tester) async {
    // 1. 把我們的計算機 App 啟動並畫到測試環境中
    await tester.pumpWidget(const CalculatorApp());

    // 2. 測試初始狀態：
    // 因為畫面上同時有「顯示器上的 0」和「按鈕上的 0」，所以我們預期會找到 2 個 '0'
    expect(find.text('0'), findsNWidgets(2));

    // 3. 模擬使用者行為：點擊數字按鈕 '7'
    // find.widgetWithText 可以精準找到「包含特定文字的按鈕(ElevatedButton)」
    await tester.tap(find.widgetWithText(ElevatedButton, '7'));
    
    // 4. 等待畫面更新 (每次點擊後，必須呼叫 pump 讓 Flutter 重新畫畫面)
    await tester.pump();

    // 5. 測試點擊後的結果：
    // 點了 '7' 之後，螢幕應該變成 '7'。
    // 加上原本的按鈕 '7'，現在畫面上應該會找到 2 個 '7'
    expect(find.text('7'), findsNWidgets(2));
    
    // 原本畫面上顯示器的 '0' 消失了，所以只剩下按鈕的 '0'，現在 '0' 應該只剩 1 個
    expect(find.text('0'), findsOneWidget);
  });
}
