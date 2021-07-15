import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sheets_api/sheets_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DisplayQA extends StatefulWidget {
  const DisplayQA({Key? key}) : super(key: key);

  @override
  _DisplayQAState createState() => _DisplayQAState();
}

class _DisplayQAState extends State<DisplayQA> {
  final List<QAmodel> items = <QAmodel>[];

  getFaqFromSheet() async {
    final uri = Uri.https("script.google.com",
        "/macros/s/AKfycbwSgZvAljBN2tcyWpuylwpFRsL71VPOdbm7jPusYzGFA50Rb7F6AiEYJFcrZDQEHoTk/exec");

    final raw = await http.get(uri);
    final jsonfaq = convert.jsonDecode(raw.body);
    print('FAQS FROM JSON $jsonfaq');

    jsonfaq.forEach((element) {
      // print('$element THIS IS NEXT>>>>>>>');
      QAmodel qaModel = new QAmodel(
          answers: element['faq_answers'], questions: element['questions']);
      //faqmodel.questions = element['questions'];
      //faqmodel.answers = element['faq_answers'];
      items.add(qaModel);
    });
  }

  late UniqueKey keyTile;
  bool isExpanded = false;

  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  @override
  void initState() {
    getFaqFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Model questions'),backgroundColor: Colors.greenAccent[400],
      ),
      body: Container(
          child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          if (items == null) return Text('loading questions');
          return Container(
            child: Padding(padding: EdgeInsets.only(left:10,right: 10),
              child: Card(
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                shadowColor: Colors.greenAccent,
                elevation: 3,
                child: ExpansionTile(
                  //key: keyTile,
                  initiallyExpanded: isExpanded,
                  childrenPadding: EdgeInsets.all(16).copyWith(top: 0),
                  title: Text(
                    items[index].questions,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Text(
                      items[index].answers,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),padding: EdgeInsets.only(bottom:10),
          );
        },
      )),
    );
  }
}
