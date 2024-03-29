import 'dart:typed_data';

import 'package:first_ui/models/model_comic_detail_info.dart' as prefix0;
import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_comic_detail_info.dart';
import 'package:first_ui/models/model_comic_info.dart';
import 'package:first_ui/models/model_preset.dart';


class PacketS2CComicDetailInfo extends PacketS2CCommon
{
  PacketS2CComicDetailInfo()
  {
    type = e_packet_type.s2c_comic_detail_info;
  }


  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    ModelComicDetailInfo.getInstance().userId = readStringToByteBuffer();
    ModelComicDetailInfo.getInstance().comicId = readStringToByteBuffer();
    ModelComicDetailInfo.getInstance().creatorName = readStringToByteBuffer();
    ModelComicDetailInfo.getInstance().mainTitleName = readStringToByteBuffer();
    ModelComicDetailInfo.getInstance().explain = readStringToByteBuffer();
    print('comicDetailInfo_explain : ${ModelComicDetailInfo.getInstance().explain}');
    ModelComicDetailInfo.getInstance().point = getDouble();

    ModelComicDetailInfo.getInstance().representationImageUrl =
      await ModelPreset.getRepresentationVerticalImageDownloadUrl(ModelComicDetailInfo.getInstance().userId, ModelComicDetailInfo.getInstance().comicId );

    if(null == ModelComicDetailInfo.getInstance().modelComicInfoList)
      ModelComicDetailInfo.getInstance().modelComicInfoList = new List<ModelComicInfo>();
    else
      ModelComicDetailInfo.getInstance().modelComicInfoList.clear();

    int comicInfoCount = getUint32();
    print('comicInfoCount : $comicInfoCount');
    for(int countIndex=0; countIndex<comicInfoCount; ++countIndex)
    {
      ModelComicInfo modelComicInfo = new ModelComicInfo();

      modelComicInfo.episodeId = readStringToByteBuffer();
      modelComicInfo.subTitleName = readStringToByteBuffer();
      modelComicInfo.collected = getUint32();
      modelComicInfo.updated = getUint32();

      modelComicInfo.userId = ModelComicDetailInfo.getInstance().userId;
      modelComicInfo.comicId = ModelComicDetailInfo.getInstance().comicId;

      modelComicInfo.thumbnailImageUrl =
      //await ModelPreset.getThumbnailImageDownloadUrl(ModelComicDetailInfo.getInstance().userId,
       //   ModelComicDetailInfo.getInstance().comicId,'001','001','00001');

      await ModelPreset.getRepresentationHorizontalImageDownloadUrl(ModelComicDetailInfo.getInstance().userId, ModelComicDetailInfo.getInstance().comicId);

      print('comicInfo_thumbnailImageURL[$countIndex] : ${modelComicInfo.thumbnailImageUrl}');

      ModelComicDetailInfo.getInstance().modelComicInfoList.add(modelComicInfo);
    }
  }

}
