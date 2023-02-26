import 'package:centennial_care/colors.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(const SearchTextField());

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: SearchTextFieldClass(),
    );
  }
}

class SearchTextFieldClass extends StatefulWidget {
  const SearchTextFieldClass({super.key});

  @override
  State<SearchTextFieldClass> createState() => _SearchTextFieldClassState();
}

class _SearchTextFieldClassState extends State<SearchTextFieldClass> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: lightGreen,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: CupertinoSearchTextField(
            controller: textController,
            placeholder: 'Enter Patient Name',
            backgroundColor: darkGreen,
          ),
        ),
      ),
    );
  }
}
