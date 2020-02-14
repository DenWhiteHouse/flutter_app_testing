import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                //padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Image.network(
                  'https://picsum.photos/250?image=9',
                ),
                constraints: BoxConstraints(
                    maxHeight: 170.0,
                    maxWidth: 170.0,
                    minWidth: 170.0,
                    minHeight: 170.0),

              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text('Titolo',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40
                    )),
                    SizedBox(height: 20,),
                    Text('Pagine:'),
                    SizedBox(height: 20,),
                    Text('Descrizione:')
                  ],
                )
              )
            ])
          ],
        ),
      ),
    );
  }
}
