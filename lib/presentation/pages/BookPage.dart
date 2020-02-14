import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_testing/network/book_model.dart';

class BookPage extends StatelessWidget {
  final book_model book;

  BookPage(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox( height: 180,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Image.network(
                      '${book.items[0].volumeInfo.imageLinks.smallThumbnail}',
                      fit: BoxFit.fill,
                    ),
                    constraints: BoxConstraints(
                        maxHeight: 180.0,
                        maxWidth: 180.0,
                        minWidth: 170.0,
                        minHeight: 170.0),

                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        AutoSizeText('${book.items[0].volumeInfo.title}',
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25

                            )),
                        SizedBox(height: 20,),
                        Text('N.Pages: ${book.items[0].volumeInfo.pageCount}'),
                        SizedBox(height: 20,),
                        AutoSizeText('${book.items[0].volumeInfo.description}',

                            style: TextStyle(
                                fontSize: 10
                            ))
                      ],
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
