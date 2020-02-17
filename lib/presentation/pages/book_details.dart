import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_testing/network/book_model.dart';

class BookDetails extends StatelessWidget {
  final book_model book;

  BookDetails(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
    children: <Widget>[
    Container(
        height: 180,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                //padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                //margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Image.network(
                  '${book.items[0].volumeInfo.imageLinks.smallThumbnail}',
                  //fit: BoxFit.fill,
                ),
                constraints: BoxConstraints(
                    maxHeight: 180.0,
                    maxWidth: 180.0,
                    minWidth: 170.0,
                    minHeight: 170.0),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText('${book.items[0].volumeInfo.title}',
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    SizedBox(
                      height: 20,
                    ),
                    Text('N.Pages: ${book.items[0].volumeInfo.pageCount}'),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Author: ${book.items[0].volumeInfo.authors.first}'),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Publighing Date: ${book.items[0].volumeInfo.publishedDate}'),
                  ],
                ),
              ),
            ]),
    ),
        SizedBox(height: 16),
        Expanded(
          child: AutoSizeText(
              '${book.items[0].volumeInfo.description}',
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 10)),
        ),
    ]
    ,
    ),
      )
    ,
    );
  }
}
