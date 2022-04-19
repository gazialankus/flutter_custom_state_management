import 'package:flutter/material.dart';
import 'package:state_management/pages/records_page.dart';
import 'package:state_management/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Repository repository;

  @override
  void initState() {
    super.initState();
    repository = Repository();
    repository.addListener(recordsUpdated);
  }

  @override
  void dispose() {
    super.dispose();
    repository.removeListener(recordsUpdated);
  }

  void recordsUpdated() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RecordsPage(
                  repository: repository,
                ),
              ),
            );
          },
          child: Text('Records (${repository.records.where((r) => r.isFavorite).length})'),
        ),
      ),
    );
  }
}
