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
  late Future<Quote> futureQuote;

  @override
  void initState() {
    super.initState();
    futureQuote = fetchQuote();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
        title: Text("Quotes"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            width: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 200, right: 30),
              child: ElevatedButton(
                child: const Text('Get Quote',
                    style: TextStyle(
                      color: Colors.black,
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
                        MaterialStateProperty.all<Color>(Colors.yellow),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.black, width: 4),
                    ))),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 40, top: 50, right: 40),
              // child:
              // Card(
              //   color: Colors.red,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(5),
              //     // side: const BorderSide(
              //     //   // color: Colors.black,
              //     //   width: 2.0,
              //     // ),
              //   ),
              child: FutureBuilder<Quote>(
                future: futureQuote,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!.quote.body,
                      style: TextStyle(color: Colors.yellow),
                    );
                  }
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!.quote.author,
                      style: TextStyle(color: Colors.red),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
              ))
        ],
      ),
    );
  }

  // void updateUI() {
  //  Navigator.of(context).push(new MaterialPageRoute(builder: (context) => ))

  // }
}
