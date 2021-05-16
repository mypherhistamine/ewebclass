import 'package:flutter/material.dart';

class Doc extends StatelessWidget {
  final String ans;
  final String q;
  Doc({this.ans, this.q});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [Text(q), Text(ans)],
        ),
      ),
    );
  }
}
