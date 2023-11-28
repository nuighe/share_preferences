import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Luu Gía Tri'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   int _score = 0;

   // trang thai class
   @override
   void initState(){
     super.initState();
     _loadScore();
   }
// ham doc data
   void _loadScore() async {
     final scoreData = await SharedPreferences.getInstance();
     setState(() {
       _score = scoreData.getInt('score') ?? 0;
     });
   }

// ham bam tang bien diem
  void _incrementScore() async {
    final scoreData = await SharedPreferences.getInstance();
    setState(() {
      _score = (scoreData.getInt('score') ?? 0) + 1;
      scoreData.setInt('score', _score); // luu gia trị vào key
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'So diem cua ban:',
            ),
            Text(
              '$_score',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementScore,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
