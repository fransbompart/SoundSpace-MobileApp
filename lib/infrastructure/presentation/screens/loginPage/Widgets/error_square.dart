import 'package:flutter/material.dart';

class ErrorSquare extends StatefulWidget {
  const ErrorSquare({super.key});

  @override
  State<ErrorSquare> createState() => ErrorSquareState();
}

class ErrorSquareState extends State<ErrorSquare> {
  bool invalidData = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: invalidData,
      child: Padding(
        padding: EdgeInsets.only(top: invalidData ? 20 : 0),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 70.0,
            width: MediaQuery.of(context).size.width * 0.95,
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 2.0,
                    ),
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0))),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                          Text(
                            "  Datos inválidos, intenta nuevamente",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                )),
          ),
        ),
      ),
    );
  }
}
