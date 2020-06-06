import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountAny extends StatefulWidget {
  @override
  _CountAnyState createState() => new _CountAnyState();
}

class _CountAnyState extends State<CountAny> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _n1;
  Future<int> _n2;
  Future<int> _n3;
  Future<int> _n4;

  Future<void> add(sectionNumber) async {
    final SharedPreferences prefs = await _prefs;
    int n1 = (prefs.getInt('_n1') ?? 0);
    int n2 = (prefs.getInt('_n2') ?? 0);
    int n3 = (prefs.getInt('_n3') ?? 0);
    int n4 = (prefs.getInt('_n4') ?? 0);

    if (sectionNumber == 1) {
      setState(() {
        n1++;
        _n1 = prefs.setInt("_n1", n1).then((bool success) {
          return n1;
        });
      });
    } else if (sectionNumber == 2) {
      setState(() {
        n2++;
        _n2 = prefs.setInt("_n2", n2).then((bool success) {
          return n2;
        });
      });
    } else if (sectionNumber == 3) {
      setState(() {
        n3++;
        _n3 = prefs.setInt("_n3", n3).then((bool success) {
          return n3;
        });
      });
    } else if (sectionNumber == 4) {
      n4++;
      _n4 = prefs.setInt("_n4", n4).then((bool success) {
        return n4;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _n1 = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('_n1') ?? 0);
    });
    _n2 = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('_n2') ?? 0);
    });
    _n3 = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('_n3') ?? 0);
    });
    _n4 = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('_n4') ?? 0);
    });
  }

  Future<void> minus(sectionNumber) async {
    final SharedPreferences prefs = await _prefs;
    int n1 = (prefs.getInt('_n1') ?? 0);
    int n2 = (prefs.getInt('_n2') ?? 0);
    int n3 = (prefs.getInt('_n3') ?? 0);
    int n4 = (prefs.getInt('_n4') ?? 0);
    switch (sectionNumber) {
      case 1:
        setState(() {
          if (n1 != 0) n1--;
          _n1 = prefs.setInt("_n1", n1).then((bool success) {
            return n1;
          });
        });
        break;
      case 2:
        setState(() {
          if (n2 != 0) n2--;
          _n2 = prefs.setInt("_n2", n2).then((bool success) {
            return n2;
          });
        });
        break;
      case 3:
        setState(() {
          if (n3 != 0) n3--;
          _n3 = prefs.setInt("_n3", n3).then((bool success) {
            return n3;
          });
        });
        break;
      case 4:
        setState(() {
          if (n4 != 0) n4--;
          _n4 = prefs.setInt("_n4", n4).then((bool success) {
            return n4;
          });
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Count Any")),
      body: new Container(
        child: new Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 2.5, bottom: 2.5),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              futureCounterSection('8mm', 1, _n1),
              Divider(
                height: 5,
              ),
              futureCounterSection('10mm', 2, _n2),
              Divider(
                height: 5,
              ),
              futureCounterSection('12mm', 3, _n3),
              Divider(
                height: 5,
              ),
              futureCounterSection('16mm', 4, _n4),
            ],
          ),
        ),
      ),
    );
  }

  Widget counterSection(sectionName, int sectionNumber, variableName) {
    return Card(
        color: Colors.blue,
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Stack(
              children: <Widget>[
                Column(children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      sectionName,
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new FloatingActionButton(
                          onPressed: () {
                            minus(sectionNumber);
                          },
                          child: new Icon(
                              const IconData(0xe15b,
                                  fontFamily: 'MaterialIcons'),
                              color: Colors.black),
                          backgroundColor: Colors.white,
                        ),
                        new Text(variableName.toString(),
                            style: new TextStyle(fontSize: 60.0)),
                        new FloatingActionButton(
                          onPressed: () {
                            add(sectionNumber);
                          },
                          child: new Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  )
                ])
              ],
            )));
  }

  Widget futureCounterSection(sectionName, int sectionNumber, variableName) {
    return Card(
        color: Colors.blue,
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Stack(
              children: <Widget>[
                Column(children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      sectionName,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new FloatingActionButton(
                          onPressed: () {
                            minus(sectionNumber);
                          },
                          child: new Icon(
                              const IconData(0xe15b,
                                  fontFamily: 'MaterialIcons'),
                              color: Colors.black),
                          backgroundColor: Colors.white,
                        ),
                        FutureBuilder<int>(
                            future: variableName,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return const CircularProgressIndicator();
                                default:
                                  if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else if(snapshot.hasData) {
                                    return Text(
                                      '${snapshot.data}',
                                      style: TextStyle(fontSize: 50),
                                    );
                                  }
                              }
                            }),
                        new FloatingActionButton(
                          onPressed: () {
                            add(sectionNumber);
                          },
                          child: new Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  )
                ])
              ],
            )));
  }
}
