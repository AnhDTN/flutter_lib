import 'dart:io';

import 'package:amazon_s3_cognito/amazon_s3_cognito.dart';
import 'package:amazon_s3_cognito/aws_region.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_lib/helpers/helpers.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class S3API {
  // static const String AWS_S3_POOLID =
  //     'ap-southeast-1:b6e09152-0c4f-46b1-a158-1bbcd15c5ff0';
  // static const String AWS_S3_BUCKETNAME = 'eng-grow';

  static const String AWS_S3_POOLID =
      'ap-southeast-1:04ce73a1-d874-425f-8172-7632a3e0941d';
  static const String AWS_S3_BUCKETNAME = 'tongdat-project';

  // static Future<String> uploadFile(BuildContext context, File file) async {
  //   String fileName = AppLocalizations.of(context)!.appName +
  //       "_" +
  //       Uuid().v1() +
  //       Helpers.getFileExtension(file.path);
  //   String uploadedImageUrl = await AmazonS3Cognito.upload(
  //           file.path,
  //           AWS_S3_BUCKETNAME,
  //           AWS_S3_POOLID,
  //           fileName,
  //           AwsRegion.AP_SOUTHEAST_1)
  //       .then((value) {
  //     return value!.replaceAll(' ', '');
  //   }, onError: (error) {
  //     print('UPLOAD ERROR: $error');
  //   });
  //   return uploadedImageUrl.replaceAll(' ', '');
  // }

  Future<String?> deleteFile(String fileName) async {
    String? result = await AmazonS3Cognito.delete(
        AWS_S3_BUCKETNAME,
        AWS_S3_POOLID,
        fileName,
        null,
        AwsRegion.AP_SOUTHEAST_1,
        AwsRegion.AP_SOUTHEAST_1);

    return result;
  }
}
