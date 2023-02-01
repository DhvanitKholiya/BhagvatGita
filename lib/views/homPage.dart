import 'package:flutter/material.dart';
import 'package:untitled/helpers/api_helper.dart';
import 'package:untitled/models/chepter.dart';

class HomePgae1 extends StatefulWidget {
  const HomePgae1({Key? key}) : super(key: key);

  @override
  State<HomePgae1> createState() => _HomePgae1State();
}

class _HomePgae1State extends State<HomePgae1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapters"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.fetchChepters(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Chapters>? data = snapshot.data as List<Chapters>?;

            return (data != null)
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 3,
                        child: ListTile(
                          leading: Text("${data[i].chapterNumber}"),
                          title: Text("${data[i].name}"),
                          subtitle: Text("${data[i].translation}"),
                          trailing: Text("${data[i].versesCount}"),
                        ),
                      );
                    },
                    itemCount: data.length,
                  )
                : Container();
          }
          return Container();
        },
      ),
    );
  }
}
