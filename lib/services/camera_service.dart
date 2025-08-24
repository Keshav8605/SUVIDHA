import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class CameraService {
  File? _image;
  String? _base64String;
  bool tapped = false;

  Future<String?> imgToBase64() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      // Read image bytes
      Uint8List imageBytes = await imageFile.readAsBytes();

      // Decode image for processing
      img.Image? originalImage = img.decodeImage(imageBytes);
      if (originalImage == null) return null;

      // Resize Image (Reduce size for fast response)
      img.Image resizedImage = img.copyResize(
        originalImage,
        width: 600,
      ); // Resize to 600px width

      // Compress Image to JPEG (Reduce file size)
      Uint8List compressedBytes = Uint8List.fromList(
        img.encodeJpg(resizedImage, quality: 70),
      );

      // Convert to Base64
      String base64String = base64Encode(compressedBytes);

      _image = imageFile;
      _base64String = base64String;

      return _base64String;
    }
    return null;
  }
}
