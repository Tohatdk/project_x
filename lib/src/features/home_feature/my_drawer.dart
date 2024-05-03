import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_x/services/routes/app_route_paths.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  context.push(AppRoutePaths.profilePageRoute.fullPath);
                  },
                child: const UserAccountsDrawerHeader(
                  accountName: Text('Your Name'),
                  accountEmail: Text('your@email.com'),
                  currentAccountPicture: CircleAvatar(
                    child: FlutterLogo(size: 42.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text('My Files'),
                  leading: const Icon(Icons.account_balance_wallet_outlined),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text('S e t t i n g s'),
                  leading: const Icon(Icons.settings),
                  onTap: () {},
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              title: Text(
                'Project X',
                style: TextStyle(
                  fontSize: 20.0, // Размер текста
                  fontWeight: FontWeight.bold, // Жирный шрифт
                  color: Colors.black, // Цвет текста
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
