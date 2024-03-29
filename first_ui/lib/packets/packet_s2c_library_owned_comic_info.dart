import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_library_owned_comic_info.dart';
import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/manage/manage_resource.dart';



class PacketS2CLibraryOwnedComicInfo extends PacketS2CCommon
{
  PacketS2CLibraryOwnedComicInfo()
  {
    type = e_packet_type.s2c_library_owned_comic_info;
  }


  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int modelMyLockerComicOwnedCount = getUint32();
    print('modelMyLockerComicOwnedCount : $modelMyLockerComicOwnedCount');


    List<ModelLibraryOwnedComicInfo> list = new List<ModelLibraryOwnedComicInfo>();

    for(int countIndex=0; countIndex<modelMyLockerComicOwnedCount; ++countIndex)
    {
      ModelLibraryOwnedComicInfo modelLibraryOwnedComicInfo = new ModelLibraryOwnedComicInfo();

      modelLibraryOwnedComicInfo.userId = readStringToByteBuffer();
      modelLibraryOwnedComicInfo.comicId = readStringToByteBuffer();
      modelLibraryOwnedComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationVerticalImageDownloadUrl(modelLibraryOwnedComicInfo.userId, modelLibraryOwnedComicInfo.comicId);
      modelLibraryOwnedComicInfo.url = url;
      modelLibraryOwnedComicInfo.thumbnailUrl = url;

      modelLibraryOwnedComicInfo.image = await ManageResource.fetchImage(url);

      print(modelLibraryOwnedComicInfo.toString());

      list.add(modelLibraryOwnedComicInfo);
    }

    ModelLibraryOwnedComicInfo.list = list;
  }
}