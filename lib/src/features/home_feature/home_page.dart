import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_x/src/features/home_feature/my_drawer.dart';
import 'package:project_x/src/features/profile_feature/data/data_source/profile_data_source.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test();
  }

  Future<void> test() async {
    final dataSource = ProfileDataSource();
    const String fileName = 'hello_world.txt';

    // Open the file
    print('object');
    if (await Permission.storage.request().isGranted) {
      print('granted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const MyDrawer(),
    );
  }
}
