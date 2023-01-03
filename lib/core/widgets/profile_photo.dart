import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gelamor/features/registeration/presentation/cubit/registration_cubit.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/assets_manager.dart';
import 'network_image.dart';

class ProfilePhotoWidget extends StatefulWidget {
  const ProfilePhotoWidget({Key? key, required this.imageUrl})
      : super(key: key);
  final String imageUrl;

  @override
  State<ProfilePhotoWidget> createState() => _ProfilePhotoWidgetState();
}

class _ProfilePhotoWidgetState extends State<ProfilePhotoWidget> {
  XFile? image;
  final picker = ImagePicker();

  Future getImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    context.read<RegistrationCubit>().image = image;
    return Stack(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: image != null
                  ? Image.file(
                      File(image!.path),
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                    )
                  : ManageNetworkImage(
                      imageUrl: widget.imageUrl,
                      width: 140,
                      height: 140,
                      borderRadius: 140,
                    ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: getImage,
            child: SvgPicture.asset(ImageAssets.editPenIcon),
          ),
        ),
      ],
    );
  }
}
