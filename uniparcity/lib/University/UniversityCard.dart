import 'package:flutter/material.dart';
import 'package:uniparcity/Model/UniversitatsModel.dart';

class UniversityCard extends StatelessWidget {
  final UniversitatsModel uni;

  const UniversityCard({
    Key? key,
    required this.uni,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(uni.Name),
          ),
          Container(
          )
        ],
      ),
    );
  }
}
