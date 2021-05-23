import 'package:covid19/data_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryDetailsScreen extends StatefulWidget {
  final countryCode;
  final country;
  CountryDetailsScreen({this.countryCode, this.country});

  @override
  _CountryDetailsScreenState createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, bottom: 20, top: 50),
      child: Column(
        children: [
          Text(
            "Covid-19 stats",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 100,
            child: FutureBuilder(
              future: DataStorage().getDeaths(widget.country),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.data == null) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "No Data found for this country :(",
                        )),
                  );
                } else {
                  return Column(
                    children: [
                      Text("Total cases = ${snapshot.data.totalCases}"),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Total deaths = ${snapshot.data.totalDeaths}",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  );
                }
              },
            ),
          ),
          Text(
            "Latest health news",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: FutureBuilder(
              future: DataStorage().getCountryNews(widget.countryCode),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.data.length == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "No news found for this country :(",
                        )),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          subtitle: snapshot.data[index]["description"] != null
                              ? Text(snapshot.data[index]["description"])
                              : Text("No description for this news"),
                          title: snapshot.data[index]["title"] != null
                              ? Text(snapshot.data[index]["title"])
                              : Text("No title for this news"),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
