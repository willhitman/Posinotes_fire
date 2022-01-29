import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:posinotes_sqlflite/model/quote.dart';
import 'package:posinotes_sqlflite/network/quotes_network.dart';
import 'package:posinotes_sqlflite/pages/dashboard_page.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  late Future<List<Quote>> futureQuote;

  @override
  void initState() {
    super.initState();
    futureQuote = fetchQuote();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color(0XFF3BAAFF),
        title: Text("Quotes"),
        automaticallyImplyLeading: false,

      ),

      body: Column(

        children: [
          Padding(padding: EdgeInsets.only(top: 100)),
          Container(
              height: 300,
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0) ),
                  color: Colors.white,
                  child: FutureBuilder<List<Quote>>(
                    future: futureQuote,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return listData(snapshot.data ?? []);
                      } else if (snapshot.hasError) {
                        log('Errrrrror');
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                  ))),
                  SizedBox(

                    child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 0, right: 30),
              child: ElevatedButton(
                child: const Text('Get Quote',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: () {
                  // updateUI();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                  );
                },
                style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0XFF3BAAFF)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.white, width: 2),
                    ))),
              ),
            ),
                  )
        ],
      ),
    );
  }

  Widget listData(List<Quote> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5 ),
            child: Card(
              color: Colors.blue,
          child:
                Text(data[index].quote,
                style: const TextStyle(
                  color: Colors.black,
                   fontWeight: FontWeight.bold
                  )
                  ),
                // const SizedBox(height: 20,)
            ),
          );
          
        });
  }
}
