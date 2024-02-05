import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>with SingleTickerProviderStateMixin  {
  late AnimationController _animationController;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
     _animationController = AnimationController(
        duration:const Duration(seconds: 2),
        vsync: this);
        _animationController.addStatusListener((status) {
          print(status);
        });
       
        _animation = Tween<double>(begin: 0, end: 2*pi).animate(_animationController);
       // _animationController.repeat();
        
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
       floatingActionButton:GestureDetector(
        onTap: () {
         _animationController.addStatusListener((status) {
          
         });
         if(_animationController.status==AnimationStatus.forward){
            _animationController.stop();
            _animationController.reset();
          }else{
            _animationController.repeat();
          }
            
        },
         child: Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(15),
           color: Colors.blue,),
          padding:const EdgeInsets.all(10),
          child: Text('Rotate')),
       ) ,
       
        body:  Center(
          child: AnimatedBuilder(
            animation: _animationController,
            
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(_animation.value),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
              );
              
            },
           // child: child,
          ),
        ),
    );
  }
}
