import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerView extends StatelessWidget {
  const ImagePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          onPressed: () {
            ImagePicker imagePicker = ImagePicker();
            imagePicker.pickImage(source: ImageSource.gallery);
          },
          icon: const Icon(Icons.image_search)),
    );
  }
}
