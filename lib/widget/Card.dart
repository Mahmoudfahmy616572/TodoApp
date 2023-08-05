// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CreatCard extends StatelessWidget {
  final String varString;
  final bool varStatus;
  final Function changeStatus;
  final int taskIndex;
  final Function delete;
  final int deleteIndex;

  const CreatCard(
      {super.key,
      required this.varString,
      required this.delete,
      required this.deleteIndex,
      required this.varStatus,
      required this.changeStatus,
      required this.taskIndex});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(taskIndex);
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Container(
            padding: EdgeInsets.all(20),
            height: 80,
            decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  varString,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      varStatus ? Icons.check : Icons.close,
                      color: varStatus ? Colors.green : Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          delete(deleteIndex);
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                          size: 30,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
