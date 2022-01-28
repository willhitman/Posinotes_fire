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
        backgroundColor: Colors.white,
        foregroundColor: Color(0XFF3BAAFF),
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
          ),
          Padding(
              padding: EdgeInsets.only(left: 40, top: 50, right: 40),
              child: Card(
                color: Color(0XFF3BAAFF),
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                child: 
               FutureBuilder<Quote>(
                future: futureQuote,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!.quote.body,
                      style: TextStyle(color: Colors.white),
                    );      
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
              )))
          )
        ],
      ),
    );
  }

  // void updateUI() {
  //  Navigator.of(context).push(new MaterialPageRoute(builder: (context) => ))

  // }
}
