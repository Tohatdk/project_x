import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_x/src/features/profile_feature/presentation/view_models/photo_url_edit_view_model.dart';

class EditProfileAvatar extends StatelessWidget {
  final PhotoUrlEditViewModel viewModel;
  final String? photoUrl;

  const EditProfileAvatar({super.key, required this.viewModel, this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '${viewModel.value}',
      // placeholder: ,
      // errorWidget: ,
      imageBuilder: (context, imageProvider) => Container(
        width: 125.0,
        height: 125.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
