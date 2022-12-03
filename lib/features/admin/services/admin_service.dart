import 'dart:io';

import 'package:amazon_clone_tech387/constants/error_handling.dart';
import 'package:amazon_clone_tech387/constants/utils.dart';
import 'package:amazon_clone_tech387/models/product.dart';
import 'package:amazon_clone_tech387/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('do3m5ntqe', 'yc9md9q8');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res
            .secureUrl); // this is downloaded URL that we get from the file base or the uploaded URL
      }

      // now we uploaded URL-s to the our MongoDB
      Product product = Product(
        name: name,
        description: description,
        price: price,
        quantity: quantity,
        category: category,
        images: imageUrls,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product added successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
