import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget _icon(IconData icon, {Color color = Colors.blue}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: Theme.of(context).backgroundColor,
      ),
      child: InkWell(
        onTap: () {
          _key.currentState.openDrawer();
        },
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }

  bool isHomePageSelected = true;
  Widget _appBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      key: _key,
      appBar: AppBar(leading: _appBar()),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Center(child:Container(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: Text('Автобусные билеты',
                    style: TextStyle(fontSize: 26)))),

            Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Text('Услуги',
                    style: TextStyle(fontSize: 26))),
            Container(height: 1, color:Colors.black),
            ListTile(
              title: Text('Покупка билетов'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Настройки'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailPage(index)));
          },
          child: Card(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: Image.network(
                              'https://www.autonastroy.ru/wp-content/uploads/2017/05/zzz.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text('YUTONG',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('KZ 123'),
                                  Text('ABC'),
                                ],
                              ),
                              Container(width: 10),
                              Column(
                                children: [
                                  Text('53 мест'),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Алматы - Нью-Йорк', style: TextStyle(fontSize: 18.0),),
                          Container(height: 30),
                          Text('Отправление', textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                          Text('Дата - 06.02.2020 Чт', style: TextStyle(fontSize: 16.0)),
                          Text('Время - 19:30', style: TextStyle(fontSize: 16.0)),
                          Text('Прибытие',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                          Text('Дата - 07.02.2020 Чт', style: TextStyle(fontSize: 16.0)),
                          Text('Время - 18:36', style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class DetailPage extends StatelessWidget {
  final int index;
  DetailPage(this.index);

  void _showModalSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Positioned(
                    child: Text(
                      "Информация о пассажире",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    top: 40,
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border:
                        Border(bottom: BorderSide(color: Colors.black))),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Dastan",
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border:
                        Border(bottom: BorderSide(color: Colors.black))),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "77777777777",
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border:
                        Border(bottom: BorderSide(color: Colors.black))),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Почта",
                          hintStyle: TextStyle(color: Colors.green)),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "Место",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "Цена",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "0 В верхни ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "3000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.green),
                            child: Center(
                              child: Text(
                                "ИЗМЕНИТЬ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.green),
                            child: Center(
                              child: Text(
                                "ОТПРАВИТЬ ЧЕК",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Center(
                    child: Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green),
                          child: Center(
                            child: Text(
                              "ОТМЕНИТЬ ПОКУПКУ БИЛЕТА",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  )
                ],
              ));
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Пассажиры'),
        ),
        body: ListView(children: <Widget>[
          DataTable(
            showCheckboxColumn: false,
            columns: [
              DataColumn(label: Text('Имя', style: TextStyle(fontSize: 20))),
              DataColumn(label: Text('Место', style: TextStyle(fontSize: 20))),
              DataColumn(label: Text('Статус', style: TextStyle(fontSize: 20))),
            ],
            rows: [
              DataRow(
                  onSelectChanged: (value) {
                    _showModalSheet(context);
                  },
                  cells: [
                    DataCell(Text('Dastan', style: TextStyle(fontSize: 18),)),
                    DataCell(Text('0 A', style: TextStyle(fontSize: 18),)),
                    DataCell(Text('ONLINE',
                        style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.green))),
                  ]),
              DataRow(
                  onSelectChanged: (value) {
                    _showModalSheet(context);
                  },
                  cells: [
                    DataCell(Text('Daryn', style: TextStyle(fontSize: 18),)),
                    DataCell(Text('0 B', style: TextStyle(fontSize: 18),)),
                    DataCell(Text('OFFLINE',
                        style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.grey))),
                  ]),
              DataRow(
                  onSelectChanged: (value) {
                    _showModalSheet(context);
                  },
                  cells: [
                    DataCell(Text('Aida', style: TextStyle(fontSize: 18),)),
                    DataCell(Text('1', style: TextStyle(fontSize: 18),)),
                    DataCell(Text('ONLINE',
                        style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.green))),
                  ]),
              DataRow(
                  onSelectChanged: (value) {
                    _showModalSheet(context);
                  },
                  cells: [
                    DataCell(Text('Lepeshka', style: TextStyle(fontSize: 18),)),
                    DataCell(Text('1', style: TextStyle(fontSize: 18),)),
                    DataCell(Text('ONLINE',
                        style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.green))),
                  ]),
            ],
          ),
          Center(
              child: Text(
                'Свободные места',
                style: TextStyle(fontSize: 20),
              )),
          DataTable(
            columns: [
              DataColumn(label: Text('', style: TextStyle(fontSize: 20))),
              DataColumn(label: Text('', style: TextStyle(fontSize: 20))),
              DataColumn(label: Text('', style: TextStyle(fontSize: 20))),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Нет имени')),
                DataCell(Text('0 A')),
                DataCell(Text('None',
                    style: TextStyle(
                        color: Colors.white, backgroundColor: Colors.green))),
              ]),
              DataRow(cells: [
                DataCell(Text('Нет имени')),
                DataCell(Text('0 B')),
                DataCell(Text('None',
                    style: TextStyle(
                        color: Colors.white, backgroundColor: Colors.green))),
              ]),
              DataRow(cells: [
                DataCell(Text('Нет имени')),
                DataCell(Text('0 B')),
                DataCell(Text('None',
                    style: TextStyle(
                        color: Colors.white, backgroundColor: Colors.green))),
              ]),
              DataRow(cells: [
                DataCell(Text('Нет имени')),
                DataCell(Text('2')),
                DataCell(Text('None',
                    style: TextStyle(
                        color: Colors.white, backgroundColor: Colors.green))),
              ]),
              DataRow(cells: [
                DataCell(Text('Нет имени')),
                DataCell(Text('2')),
                DataCell(Text('None',
                    style: TextStyle(
                        color: Colors.white, backgroundColor: Colors.green))),
              ]),
            ],
          ),
        ]));
  }
}