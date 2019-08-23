
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:first_ui/models/model_common.dart';
import 'package:first_ui/manage/manage_flutter_cache_manager.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:first_ui/manage/manage_firebase_storage.dart';
import 'package:first_ui/manage/manage_firebase_ml_vision.dart';
import 'package:first_ui/manage/manage_image.dart';



class BoundingBoxInfo
{
  Rect boundingBox;
  int countIndex = -1;
  String text = '';
  bool changed = false;
}


class ModelTextDetection
{
  int _previousImageTotalHeight = 0;
  ui.Image _image;
  List<TextBlock> _textBlockList = new List<TextBlock>();
  ManageImage _manageImage = new ManageImage();
  Uint8List _uint8list;

  int get previousImageTotalHeight => _previousImageTotalHeight;
  List<TextBlock> get textBlockList => _textBlockList;
  ui.Image get image => _image;
  ManageImage  get manageImage => _manageImage;
  Uint8List get uint8List => _uint8list;

  set image(ui.Image image)
  {
    _image = image;
  }
  set uint8List(Uint8List uint8List)
  {
    _uint8list = uint8List;
  }
  set previousImageTotalHeight(int previousImageTotalHeight)
  {
    _previousImageTotalHeight = previousImageTotalHeight;
  }

  static List<ModelTextDetection> list;
  static List<BoundingBoxInfo> boundingBoxInfoList;
  static int imageTotalHeight = 0;


  static Future<List<ModelTextDetection>> generate() async
  {
    if(null != list) {
      list.clear();
      list = null;
    }

    bool useCloud = true;
    List<String> urlList = new List<String>();
    urlList.add('comics/01.jpg');
    urlList.add('comics/02.jpg');


       int boundingBoxCountIndex = 0;
       int previousImageTotalHeight = 0;
       for(int countIndex=0; countIndex<urlList.length; ++countIndex)
       {
         //'comics/01.jpg'
         String url;

         final ref = FirebaseStorage.instance.ref().child(urlList[countIndex]);
         ref.getDownloadURL().then((value)
         {
           //value == String
           print('success : $value');
         },
             onError: (error)
             {
               print('error : $error');
             }).catchError( (error)
         {
           print('catchError : $error');
         });


         FileInfo fileInfo = await ManageFlutterCacheManager.downloadFile(url);
         VisionText visionText = await ManageFirebaseMLVision.detectTextFromFile(fileInfo.file, useCloud);

         ModelTextDetection modelTextDetection = new ModelTextDetection();

         if (false ==
             modelTextDetection.manageImage.decode(fileInfo.file.readAsBytesSync())) {
           print('false == manageImage.decode');
         } else {
           print(
               'imaghe size - width : ${modelTextDetection.manageImage.width} , height : ${modelTextDetection.manageImage.height}');
         }

         if (null != visionText.blocks) {
           for (int i = 0; i < visionText.blocks.length; ++i) {
             TextBlock textBlock = visionText.blocks[i];

             modelTextDetection.textBlockList.add(textBlock);

             if(null == boundingBoxInfoList)
               boundingBoxInfoList = new List<BoundingBoxInfo>();

             BoundingBoxInfo boundingBoxInfo = new BoundingBoxInfo();
             boundingBoxInfo.countIndex = boundingBoxCountIndex ++;
             boundingBoxInfo.boundingBox = textBlock.boundingBox;
             boundingBoxInfo.text = '';
             boundingBoxInfoList.add(boundingBoxInfo);

        //if (null != textBlock.recognizedLanguages)
        //{
        //  for (int m = 0; m < textBlock.recognizedLanguages.length; ++m)
        //  {
        //    print('recognizedLanguages[$m] : ${textBlock.recognizedLanguages.elementAt(m).toString()}');
        //  }
        //}


             //print('text[$i] : ${textBlock.text}');
             // print('boundingBox[$i] : ${textBlock.boundingBox.toString()}');
             //print('cornerPoints[$i] : ${textBlock.cornerPoints.toString()}');

             if (null != textBlock.lines) {
               for (int j = 0; j < textBlock.lines.length; ++j) {
                 // print('linetext[$i][$j] : ${textBlock.lines[j].text}');
               }
             }
           }
         }

         /*
         print('textBlockList Count : ${modelTextDetection.textBlockList.length}');
         modelTextDetection.uint8List = await ModelCommon.getUint8ListFromFile(fileInfo.file);
        */

          if(null == list)
            list = new List<ModelTextDetection>();
         list.add(modelTextDetection);

         if(0 < countIndex)
           previousImageTotalHeight += list[countIndex-1].manageImage.height;
         modelTextDetection.previousImageTotalHeight = previousImageTotalHeight;

         imageTotalHeight += modelTextDetection.manageImage.height;
       }



       return list;
     }





  /*
  static Future<ui.Image> loadImage(List<int> img) async
  {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img));
      return completer.complete(img);
    });
    return completer.future;
  }
  */
  //image = await loadImage(list);


}