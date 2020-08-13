import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_luck/common_widgets/custom_scaffold.dart';

void main() {
  test('Class has default color', () {
    final customScaffold = new CustomScaffold();
    Color defaultColor = customScaffold.createState().bGroundColor;
    expect(defaultColor, new Color(0x33F44336));
  });

  test('Class should change default color to random', () {
    final customScaffold = new CustomScaffold();
    Color defaultColor = customScaffold.createState().bGroundColor;
    Color changedColor = customScaffold.createState().changeColorToRandom();
    expect(defaultColor, isNot(changedColor));
  });

  testWidgets('DicePage has a welcome text', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(CustomScaffold());
    final explainTest = find.text('Play Dice');
    expect(explainTest, findsWidgets);
  });

  testWidgets('finds a Text widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Center(
        child: Text('Play Dice'),
      ),
    ));
    expect(find.text('Play Dice'), findsOneWidget);
  });
}
