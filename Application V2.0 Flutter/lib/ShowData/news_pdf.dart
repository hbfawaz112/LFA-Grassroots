  import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class news_pdf extends StatefulWidget {
  String pdf_name_1;


  news_pdf(String pdf_name_0)
  {
    this.pdf_name_1 = pdf_name_0 ;
  }

  @override
  _MyAppState createState() => _MyAppState(pdf_name_1);
}

class _MyAppState extends State<news_pdf> {
  String urlPDFPath = "";
  String pdf_name_3 ;
  String pdf_name_4 ;
  _MyAppState(String pdf_name_2)
  {
    this.pdf_name_3 = pdf_name_2 ;
    pdf_name_4 = this.pdf_name_3 + ".pdf" ;
    print(pdf_name_4);
  }
  @override
  void initState() {
    super.initState();

    getFileFromUrl("http://192.168.1.113:8080/flutter_football/ta3amim/$pdf_name_4").then((f) {
      setState(() {
        urlPDFPath = f.path;
        print(urlPDFPath);
      });
    });
  }


  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$pdf_name_4");

      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  @override
  Widget build(BuildContext context) {
      var themecolor=Color(0xFF112734);


 Future<void> _launched;
 
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:themecolor ,
          title: Text("News and Circulars-اخبار و تعاميم "),
        ),
        body: Center(
          child: Builder(
            builder: (context) => Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                   // margin:new EdgeInsets.symmetric(vertical:2.0,horizontal:8.0),
                    child:new Card(
                        
                      child: Image.asset('assets/new_eti7ad.png',height: 300,width:300),
                    )

                ),
                SizedBox(
                  height: 50,
                ),
                new MaterialButton( 
                    height: 100.0, 
                    minWidth: 350.0, 
                    color: Theme.of(context).primaryColor, 
                    textColor: Colors.white, 
                    child: 
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                        Text("Click To Continue  ",style: TextStyle(fontSize:20.0,fontWeight:FontWeight.w900),),
                        Icon(Icons.picture_as_pdf,size: 40.0,)

                          ]
                        ),
                        Text("(See Here As A PDF)",style: TextStyle(fontSize:20.0,fontWeight:FontWeight.w900),),
                        
                      ],
                    ),
                      
                    onPressed: () {
                      if (urlPDFPath != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PdfViewPage(path: urlPDFPath)));
                    }
                    }, 
                   // splashColor: Colors.redAccent,
                    ),
                /*RaisedButton(
                  
                  color: Colors.amber,
                  child: Text("clilck here to view",style: TextStyle(
                     fontSize: 15.0,
                       fontWeight: FontWeight.w900,
                       color:Colors.black
                  ),),
                  onPressed: () {
                    if (urlPDFPath != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PdfViewPage(path: urlPDFPath)));
                    }
                  },
                ),*/
                SizedBox(
                  height: 20,
                ),
                new MaterialButton( 
                    height: 100.0, 
                    minWidth: 350.0, 
                    color: Theme.of(context).primaryColor, 
                    textColor: Colors.white, 
                    child: 
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                        Text("Click To Download    ",style: TextStyle(fontSize:20.0,fontWeight:FontWeight.w900),),
                        Icon(Icons.cloud_download,size: 40.0,)

                          ]
                        ),
                        Text("(Download As A PDF File)",style: TextStyle(fontSize:20.0,fontWeight:FontWeight.w900),),
                        
                      ],
                    ),
                      
                    onPressed: () {
                     _launched = _launchInBrowser('http://192.168.1.113:8080/flutter_football/ta3amim/{${pdf_name_4}');
                    }, 
                   // splashColor: Colors.redAccent,
                    ),
               /* RaisedButton(
                  color: Colors.greenAccent,
                  child: Text("clilck here to download ",style: TextStyle(
                     fontSize: 15.0,
                                                  fontWeight: FontWeight.w900,
                                                  color:Colors.black
                  ),),
                  onPressed: () {
                    if (urlPDFPath != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PdfViewPage(path: urlPDFPath)));
                    }
                  },
                ),*/

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Annoucement"),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {
              print(e);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },
            onPageChanged: (int page, int total) {
              setState(() {});
            },
            onPageError: (page, e) {},
          ),
          !pdfReady
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Offstage()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _currentPage > 0
              ? FloatingActionButton.extended(
            backgroundColor: Colors.red,
            label: Text("Go to ${_currentPage - 1}"),
            onPressed: () {
              _currentPage -= 1;
              _pdfViewController.setPage(_currentPage);
            },
          )
              : Offstage(),
          _currentPage+1 < _totalPages
              ? FloatingActionButton.extended(
            backgroundColor: Colors.green,
            label: Text("Go to ${_currentPage + 1}"),
            onPressed: () {
              _currentPage += 1;
              _pdfViewController.setPage(_currentPage);
            },
          )
              : Offstage(),
        ],
      ),
    );
  }
}
