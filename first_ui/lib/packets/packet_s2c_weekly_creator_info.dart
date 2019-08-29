import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_weekly_creator_info.dart';
import 'package:first_ui/models/model_preset.dart';


class PacketS2CWeeklyCreatorInfo extends PacketS2CCommon
{
  PacketS2CWeeklyCreatorInfo()
  {
    type = e_packet_type.s2c_weekly_creator_info;
  }

  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int modelWeeklyCreatorInfoCount = getUint32();
    print('modelWeeklyCreatorInfoCount : $modelWeeklyCreatorInfoCount');
    for(int countIndex=0; countIndex<modelWeeklyCreatorInfoCount; ++countIndex)
    {
      ModelWeeklyCreatorInfo modelFeaturedComicInfo = new ModelWeeklyCreatorInfo();

      modelFeaturedComicInfo.userId = readStringToByteBuffer();
      modelFeaturedComicInfo.comicId = readStringToByteBuffer();
      modelFeaturedComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getBannerImageDownloadUrl(modelFeaturedComicInfo.userId, modelFeaturedComicInfo.comicId);
      modelFeaturedComicInfo.url = url;
      modelFeaturedComicInfo.thumbnailUrl = url;

      print(modelFeaturedComicInfo.toString());

      if(null == ModelWeeklyCreatorInfo.list)
        ModelWeeklyCreatorInfo.list = new List<ModelWeeklyCreatorInfo>();
      ModelWeeklyCreatorInfo.list.add(modelFeaturedComicInfo);
    }
  }

  /*
  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int modelWeeklyCreatorInfoCount = getUint32();
    print('modelWeeklyCreatorInfoCount : $modelWeeklyCreatorInfoCount');

    for(int countIndex=0; countIndex<modelWeeklyCreatorInfoCount; ++countIndex)
    {
      ModelWeeklyCreatorInfo modelWeeklyCreatorInfo = new ModelWeeklyCreatorInfo();

      modelWeeklyCreatorInfo.id = readStringToByteBuffer();
      modelWeeklyCreatorInfo.explain = readStringToByteBuffer();
      modelWeeklyCreatorInfo.url = readStringToByteBuffer();

      print(modelWeeklyCreatorInfo.toString());

      if(null == ModelWeeklyCreatorInfo.list)
        ModelWeeklyCreatorInfo.list = new List<ModelWeeklyCreatorInfo>();
      ModelWeeklyCreatorInfo.list.add(modelWeeklyCreatorInfo);

    }
  }
  */


}