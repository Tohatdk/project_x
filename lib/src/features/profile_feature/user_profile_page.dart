
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_x/src/features/profile_feature/user_profile_page_bloc/profile_page_bloc.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('P r o f i l e'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              _showPopupMenu(context);
            },
          ),
        ],
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                _ProfileAvatar(imageUrl: 'https://hips.hearstapps.com/hmg-prod/images/gettyimages-926895120.jpg?resize=1200:*',),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 24),
                    SizedBox(width: 10),
                    Text(
                      'John Doe',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, size: 18),
                    SizedBox(width: 10),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, size: 18),
                    SizedBox(width: 10),
                    Text(
                      '+1234567890',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showPopupMenu(BuildContext context) async {
    final bloc= context.read<ProfilePageBloc>();
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 0, 0),
      items: [
        PopupMenuItem(
          child: const ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit'),
          ),
          onTap: () {},
        ),
        PopupMenuItem(
          child: const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
          onTap: () {
         bloc.add(SignoutEvent() );             },
        ),
      ],
      elevation: 8.0,
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  const _ProfileAvatar({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          width: 125.0,
          height: 125.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: imageProvider, fit: BoxFit.cover,),
          ),
        ),

    );
  }
}
