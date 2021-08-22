import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection/realtime/live_camera.dart';
import 'package:object_detection/static%20image/static.dart';
List<CameraDescription> cameras;

Future<void> main() async {
  // initialize the cameras when the app starts
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  // running the app
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    )
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Object Detector App'),
            ),
            body: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/back.jpg"),
                        fit: BoxFit.cover)),
               
                child: Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Ink(
                      decoration: const 
                      ShapeDecoration(
                        color: Colors.lightBlue, 
                        shape: CircleBorder(), ),
                        child: IconButton(
                          onPressed: () {Navigator.push(context, MaterialPageRoute(
                      builder: (context) => StaticImage(),
                      ),
                    );
                    },
                    icon: Icon(
                      Icons. photo,
                      color: Colors.white,
                    ),
                    iconSize: 80.0,
                    ),
                    ),
                    Ink(
                      decoration: const 
                      ShapeDecoration(
                        color: Colors.lightBlue, 
                        shape: CircleBorder(), ),
                        child: IconButton(
                          onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => LiveFeed(cameras),
                      ),
                    );
                  },
                    icon: Icon(
                      Icons. camera,
                      color: Colors.white,
                    ),
                    iconSize: 80.0,
                    ),
                    )
                  ] 
                  ),
                  )

  
                  )
                  )
                  );
  }
}


