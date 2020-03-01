import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data_recv = {};

  @override
  Widget build(BuildContext context) {

    data_recv = data_recv.isNotEmpty ? data_recv : ModalRoute.of(context).settings.arguments;
    print(data_recv);

    String bgImage = data_recv['isDayTime'] ? 'day.png' : 'night.png' ;
    Color bgColor = data_recv['isDayTime']  ? Colors.blue : Colors.indigo[700];

     return Scaffold(
       backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                image : AssetImage('assets/$bgImage'),
                fit : BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
        children: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  dynamic res = await Navigator.pushNamed(context,'/location');
                  setState(() {
                    data_recv = {
                      'time':res['time'],
                      'location':res['location'],
                      'isDayTime':res['isDayTime'],
                      'flag':res['flag']
                    };
                  });
                },
                icon:Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                ),
                label:Text(
                    'Edit Location',
                     style: TextStyle(
                       color: Colors.grey[300],
                       fontSize: 20.0,
                     )
                )
              ),
              SizedBox(height: 18.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data_recv['location'],
                    style: TextStyle(
                      fontSize: 26.0,
                      letterSpacing: 1.9,
                      color:Colors.white,
                    )
                  )
                ],
              ),
            SizedBox(height:20.0),
            Text(
              data_recv['time'],
              style:TextStyle(
                fontSize: 55.0,
                color:Colors.white,
              )
            )
        ],
      ),
            ),
          )),
    );
  }
}
