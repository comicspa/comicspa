
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:first_ui/manage/manage_file_picker.dart';
import 'package:first_ui/models/model_common.dart';

/*
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write;
    }
  }
}
*/

class ManageFirebaseStorage
{
  static void getDownloadURL(String fileFullPathName)  async
  {
    final ref = FirebaseStorage.instance.ref().child(fileFullPathName);
    String url = await ref.getDownloadURL().then((value)
    {
      //value == String
      print(value.toString());
      print('success');
    },
        onError: (error)
        {
          print('error : $error');
        }).catchError( (error)
    {
      print('catchError : $error');
    });
  }

  static void simpleUsageUploadFile(String pathName) async
  {
    print('simpleUsageUploadFile - start');


    Map<String,String> filePathsMap = await ManageFilePicker.getMultiFilePath();
    if(null != filePathsMap)
    {
      for (var data in filePathsMap.keys)
      {
        String fileFullName = data;
        String fileFullPath = filePathsMap[data];

        print('getfilePath : $fileFullName , $fileFullPath');

        Uint8List uint8list = await ModelCommon.getUint8ListFromFile(fileFullPath);

        String fileFullPathName = 'comics';
        if(true != pathName.isEmpty && 0 < pathName.length)
          fileFullPathName += '/$pathName';
        fileFullPathName += '/$fileFullName';

        final StorageReference storageReference = FirebaseStorage().ref().child(fileFullPathName);
        final StorageUploadTask uploadTask = storageReference.putData(uint8list);

        final StreamSubscription<StorageTaskEvent> streamSubscription = uploadTask.events.listen((event) {
          // You can use this to notify yourself or your user in any kind of way.
          // For example: you could use the uploadTask.events stream in a StreamBuilder instead
          // to show your user what the current status is. In that case, you would not need to cancel any
          // subscription as StreamBuilder handles this automatically.

          // Here, every StorageTaskEvent concerning the upload is printed to the logs.
          print('EVENT ${event.type}');
        });

        // Cancel your subscription when done.
        await uploadTask.onComplete;
        streamSubscription.cancel();
      }
    }

    print('simpleUsageUploadFile - finish');
  }


  static void simpleUsageDownloadFile2TempDirectory(String httpPath) async
  {
    print('simpleUsageDownloadFile2TempDirectory - start');

    String uri = Uri.decodeFull(httpPath);
    final RegExp regex = RegExp('([^?/]*\.(jpg))');
    final String fileName = regex.stringMatch(uri);

    final Directory tempDir = Directory.systemTemp;
    final File file = File('${tempDir.path}/$fileName');

    //actual downloading stuff
    final StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
    final StorageFileDownloadTask downloadTask = ref.writeToFile(file);

    final int byteNumber = (await downloadTask.future).totalByteCount;
    print(byteNumber);

    print('simpleUsageDownloadFile2TempDirectory - finish');
  }



}