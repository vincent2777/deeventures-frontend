import 'package:flutter/material.dart';

import 'models/value_row.dart';

class ValueRowWidget extends StatelessWidget {
  final int index;
  final ValueRow row;
  final VoidCallback onRemove;
  final Function(double?, int) onValueChanged;

  const ValueRowWidget({super.key,
    required this.index,
    required this.row,
    required this.onRemove,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        Expanded(
          flex: 5,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade50,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide:  BorderSide(
                  color: Colors.grey.shade50,
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade50,
                  width: 2.0,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              filled: true,
              fillColor: Colors.white,
              hintText: "Enter Value",
              hintStyle: const TextStyle(
                color: Colors.black26,
                fontSize: 14.0,
              ),

            ),            onChanged: (text) {
            row.value = double.tryParse(text);
            onValueChanged(row.value, index);
          },
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          flex: 4,
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade50,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide:  BorderSide(
                  color: Colors.grey.shade50,
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade50,
                  width: 2.0,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              filled: true,
              fillColor: Colors.white,
              hintText: "0",
              hintStyle: const TextStyle(
                color: Colors.black26,
                fontSize: 14.0,
              ),

            ),
            controller: TextEditingController(text: row.estimatedValue?.toStringAsFixed(2) ?? ''),
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          flex: 1,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.redAccent,
            ),
            child: Center(
              child: GestureDetector(
                onTap: onRemove,
                child: const Icon(Icons.remove, color: Colors.white,size: 16,),
              ),
            ),
          ),
        ),


      ],
    ),);
  }
}