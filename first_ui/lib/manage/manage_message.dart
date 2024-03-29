import 'dart:async';

import 'package:first_ui/models/model_featured_comic_info.dart';
import 'package:first_ui/models/model_library_continue_comic_info.dart';
import 'package:first_ui/models/model_library_owned_comic_info.dart';
import 'package:first_ui/models/model_library_recent_comic_info.dart';
import 'package:first_ui/models/model_library_view_list_comic_info.dart';
import 'package:first_ui/models/model_recommended_comic_info.dart';
import 'package:first_ui/models/model_new_comic_info.dart';
import 'package:first_ui/models/model_real_time_trend_info.dart';
import 'package:first_ui/models/model_weekly_trend_comic_info.dart';
import 'package:first_ui/models/model_today_trend_comic_info.dart';

import 'package:first_ui/packets/packet_common.dart';
import "package:first_ui/packets/packet_c2s_common.dart";
import 'package:first_ui/packets/packet_c2s_recommended_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_featured_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_real_time_trend_info.dart';
import 'package:first_ui/packets/packet_c2s_new_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_today_trend_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_weekly_trend_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_library_recent_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_library_view_list_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_library_owned_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_library_continue_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_preset_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_preset_library_info.dart';

class ManageMessage
{
  static const int __LOOP_SECOND = 1;
  static Timer __timer;
  static List<PacketC2SCommon> __messageList;
  static StreamController<e_packet_type>  __streamController;

  static StreamController<e_packet_type> get streamController => __streamController;

  static void generate()
  {
    if(null == __streamController)
      __streamController = new StreamController.broadcast();

    if(null == __messageList)
      __messageList = new List<PacketC2SCommon>();

    const duration = const Duration(seconds:__LOOP_SECOND);
    if(null == __timer)
      __timer = new Timer.periodic(duration, update);
  }

  static void dispose()
  {
    if(null != __streamController)
    {
      if(false == __streamController.isClosed)
        __streamController.close();
      __streamController = null;
    }
  }

  static void add(PacketC2SCommon packetC2SCommon)
  {
    __messageList.add(packetC2SCommon);
  }

  static void dispatch(PacketC2SCommon packetC2SCommon)
  {


    switch (packetC2SCommon.type) {
      case e_packet_type.c2s_featured_comic_info:
        {
          PacketC2SFeaturedComicInfo packet = packetC2SCommon as PacketC2SFeaturedComicInfo;

          print("Creating a  stream...");
          Stream<List<ModelFeaturedComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
          print("Created the stream");

          stream.listen((data) {

            print('DataReceived');
          }, onDone: () {
            print('Task Done');
            //print('Task Done - size :  ${ModelFeaturedComicInfo.list.length}');

            __streamController.add(packetC2SCommon.type);

          }, onError: (error) {
            print("Some Error");


          });


        }
        break;

      case e_packet_type.c2s_recommended_comic_info:
        {
          PacketC2SRecommendedComicInfo packet = packetC2SCommon as PacketC2SRecommendedComicInfo;

          print("Creating a stream...");
          Stream<List<ModelRecommendedComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
          print("Created the stream");

          stream.listen((data) {
            //print('DataReceived - size :  ${data.size}');
            print('DataReceived');
          }, onDone: () {
            print("Task Done");

            __streamController.add(packetC2SCommon.type);

          }, onError: (error) {
            print("Some Error");


          });


        }
        break;

      case e_packet_type.c2s_real_time_trend_info:
        {
          PacketC2SRealTimeTrendInfo packet = packetC2SCommon as PacketC2SRealTimeTrendInfo;

          print("Creating a stream...");
          Stream<List<ModelRealTimeTrendInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
          print("Created the stream");

          stream.listen((data) {
            //print('DataReceived - size :  ${data.size}');
            print('DataReceived');
          }, onDone: () {
            print("Task Done");

            __streamController.add(packetC2SCommon.type);

          }, onError: (error) {
            print("Some Error");


          });
        }
        break;


      case e_packet_type.c2s_new_comic_info:
        {
          PacketC2SNewComicInfo packet = packetC2SCommon as PacketC2SNewComicInfo;

          print("Creating a stream...");
          Stream<List<ModelNewComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
          print("Created the stream");

          stream.listen((data) {
            //print('DataReceived - size :  ${data.size}');
            print('DataReceived');
          }, onDone: () {
            print("Task Done");

            __streamController.add(packetC2SCommon.type);

          }, onError: (error) {
            print("Some Error");


          });
        }
        break;


      case e_packet_type.c2s_today_trend_comic_info:
        {
          PacketC2STodayTrendComicInfo packet = packetC2SCommon as PacketC2STodayTrendComicInfo;

          print("Creating a stream...");
          Stream<List<ModelTodayTrendComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
          print("Created the stream");

          stream.listen((data) {
            //print('DataReceived - size :  ${data.size}');
            print('DataReceived');
          }, onDone: () {
            print("Task Done");

            __streamController.add(packetC2SCommon.type);

          }, onError: (error) {
            print("Some Error");


          });
        }
        break;


      case e_packet_type.c2s_weekly_trend_comic_info:
        {
          PacketC2SWeeklyTrendComicInfo packet = packetC2SCommon as PacketC2SWeeklyTrendComicInfo;

          print("Creating a stream...");
          Stream<List<ModelWeeklyTrendComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
          print("Created the stream");

          stream.listen((data) {
            //print('DataReceived - size :  ${data.size}');
            print('DataReceived');
          }, onDone: () {
            print("Task Done");

            __streamController.add(packetC2SCommon.type);

          }, onError: (error) {
            print("Some Error");


          });
        }
        break;


      case e_packet_type.c2s_library_recent_comic_info:
        {
          PacketC2SLibraryRecentComicInfo packet = packetC2SCommon as PacketC2SLibraryRecentComicInfo;

          print("Creating a stream...");
          Stream<List<ModelLibraryRecentComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
          print("Created the stream");

          stream.listen((data) {
            //print('DataReceived - size :  ${data.size}');
            print('DataReceived');
          }, onDone: () {
            print("Task Done");

            __streamController.add(packetC2SCommon.type);

          }, onError: (error) {
            print("Some Error");


          });
        }
        break;


      case e_packet_type.c2s_library_view_list_comic_info:
        {
          PacketC2SLibraryViewListComicInfo packet = packetC2SCommon as PacketC2SLibraryViewListComicInfo;

          print("Creating a stream...");
          Stream<List<ModelLibraryViewListComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
          print("Created the stream");

          stream.listen((data) {
            //print('DataReceived - size :  ${data.size}');
            print('DataReceived');
          }, onDone: () {
            print("Task Done");

            __streamController.add(packetC2SCommon.type);

          }, onError: (error) {
            print("Some Error");


          });
        }
        break;

      case e_packet_type.c2s_library_owned_comic_info:
        {
          PacketC2SLibraryOwnedComicInfo packet = packetC2SCommon as PacketC2SLibraryOwnedComicInfo;

          print("Creating a stream...");
          Stream<List<ModelLibraryOwnedComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
          print("Created the stream");

          stream.listen((data) {
            //print('DataReceived - size :  ${data.size}');
            print('DataReceived');
          }, onDone: () {
            print("Task Done");

            __streamController.add(packetC2SCommon.type);

          }, onError: (error) {
            print("Some Error");


          });
        }
        break;


      case e_packet_type.c2s_library_continue_comic_info:
        {
          PacketC2SLibraryContinueComicInfo packet = packetC2SCommon as PacketC2SLibraryContinueComicInfo;

          print("Creating a stream...");
          Stream<List<ModelLibraryContinueComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
          print("Created the stream");

          stream.listen((data) {
            //print('DataReceived - size :  ${data.size}');
            print('DataReceived');
          }, onDone: () {
            print("Task Done");

            __streamController.add(packetC2SCommon.type);

          }, onError: (error) {
            print("Some Error");


          });
        }
        break;

      default:
        break;
    }
  }



  static void update(Timer timer)
  {
      //print('start current time : ${timer.tick}');

    if(null != __messageList)
      {
        //if(0 == __dispatchPacketStatus)
        {
          if (0 < __messageList.length)
          {
            PacketC2SCommon packetC2SCommon = __messageList[0];

            switch (packetC2SCommon.type) {
              case e_packet_type.c2s_featured_comic_info:
                {

                  PacketC2SFeaturedComicInfo packet = packetC2SCommon as PacketC2SFeaturedComicInfo;

                  print("Creating a sample stream...");
                  Stream<List<ModelFeaturedComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
                  print("Created the stream");

                  stream.listen((data) {
                    print('DataReceived');
                  }, onDone: () {
                    print("Task Done");
                    __streamController.add(packetC2SCommon.type);

                  }, onError: (error) {
                    print("Some Error");

                  });

                  __messageList.removeAt(0);
                }
                break;

              case e_packet_type.c2s_recommended_comic_info:
                {
                  PacketC2SRecommendedComicInfo packet = packetC2SCommon as PacketC2SRecommendedComicInfo;

                  print("Creating a sample stream...");
                  Stream<List<ModelRecommendedComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
                  print("Created the stream");

                  stream.listen((data) {
                    print('DataReceived');
                  }, onDone: () {
                    print("Task Done");
                    __streamController.add(packetC2SCommon.type);

                  }, onError: (error) {
                    print("Some Error");
                  });

                  __messageList.removeAt(0);
                }
                break;

              case e_packet_type.c2s_real_time_trend_info:
                {
                  PacketC2SRealTimeTrendInfo packet = packetC2SCommon as PacketC2SRealTimeTrendInfo;

                  print("Creating a stream...");
                  Stream<List<ModelRealTimeTrendInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
                  print("Created the stream");

                  stream.listen((data) {
                    //print('DataReceived - size :  ${data.size}');
                    print('DataReceived');
                  }, onDone: () {
                    print("Task Done");

                    __streamController.add(packetC2SCommon.type);

                  }, onError: (error) {
                    print("Some Error");


                  });

                  __messageList.removeAt(0);
                }
                break;


              case e_packet_type.c2s_new_comic_info:
                {
                  PacketC2SNewComicInfo packet = packetC2SCommon as PacketC2SNewComicInfo;

                  print("Creating a stream...");
                  Stream<List<ModelNewComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
                  print("Created the stream");

                  stream.listen((data) {
                    //print('DataReceived - size :  ${data.size}');
                    print('DataReceived');
                  }, onDone: () {
                    print("Task Done");

                    __streamController.add(packetC2SCommon.type);

                  }, onError: (error) {
                    print("Some Error");


                  });

                  __messageList.removeAt(0);
                }
                break;


              case e_packet_type.c2s_today_trend_comic_info:
                {
                  PacketC2STodayTrendComicInfo packet = packetC2SCommon as PacketC2STodayTrendComicInfo;

                  print("Creating a stream...");
                  Stream<List<ModelTodayTrendComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
                  print("Created the stream");

                  stream.listen((data) {
                    //print('DataReceived - size :  ${data.size}');
                    print('DataReceived');
                  }, onDone: () {
                    print("Task Done");

                    __streamController.add(packetC2SCommon.type);

                  }, onError: (error) {
                    print("Some Error");


                  });

                  __messageList.removeAt(0);
                }
                break;


              case e_packet_type.c2s_weekly_trend_comic_info:
                {
                  PacketC2SWeeklyTrendComicInfo packet = packetC2SCommon as PacketC2SWeeklyTrendComicInfo;

                  print("Creating a stream...");
                  Stream<List<ModelWeeklyTrendComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
                  print("Created the stream");

                  stream.listen((data) {
                    //print('DataReceived - size :  ${data.size}');
                    print('DataReceived');
                  }, onDone: () {
                    print("Task Done");

                    __streamController.add(packetC2SCommon.type);

                  }, onError: (error) {
                    print("Some Error");


                  });

                  __messageList.removeAt(0);
                }
                break;


              case e_packet_type.c2s_library_recent_comic_info:
                {
                  PacketC2SLibraryRecentComicInfo packet = packetC2SCommon as PacketC2SLibraryRecentComicInfo;

                  print("Creating a stream...");
                  Stream<List<ModelLibraryRecentComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
                  print("Created the stream");

                  stream.listen((data) {
                    //print('DataReceived - size :  ${data.size}');
                    print('DataReceived');
                  }, onDone: () {
                    print("Task Done");

                    __streamController.add(packetC2SCommon.type);

                  }, onError: (error) {
                    print("Some Error");


                  });

                  __messageList.removeAt(0);
                }
                break;


              case e_packet_type.c2s_library_view_list_comic_info:
                {
                  PacketC2SLibraryViewListComicInfo packet = packetC2SCommon as PacketC2SLibraryViewListComicInfo;

                  print("Creating a stream...");
                  Stream<List<ModelLibraryViewListComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
                  print("Created the stream");

                  stream.listen((data) {
                    //print('DataReceived - size :  ${data.size}');
                    print('DataReceived');
                  }, onDone: () {
                    print("Task Done");

                    __streamController.add(packetC2SCommon.type);

                  }, onError: (error) {
                    print("Some Error");


                  });

                  __messageList.removeAt(0);
                }
                break;

              case e_packet_type.c2s_library_owned_comic_info:
                {
                  PacketC2SLibraryOwnedComicInfo packet = packetC2SCommon as PacketC2SLibraryOwnedComicInfo;

                  print("Creating a stream...");
                  Stream<List<ModelLibraryOwnedComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
                  print("Created the stream");

                  stream.listen((data) {
                    //print('DataReceived - size :  ${data.size}');
                    print('DataReceived');
                  }, onDone: () {
                    print("Task Done");

                    __streamController.add(packetC2SCommon.type);

                  }, onError: (error) {
                    print("Some Error");


                  });

                  __messageList.removeAt(0);
                }
                break;


              case e_packet_type.c2s_library_continue_comic_info:
                {
                  PacketC2SLibraryContinueComicInfo packet = packetC2SCommon as PacketC2SLibraryContinueComicInfo;

                  print("Creating a stream...");
                  Stream<List<ModelLibraryContinueComicInfo>> stream = new Stream.fromFuture(packet.fetchBytes());
                  print("Created the stream");

                  stream.listen((data) {
                    //print('DataReceived - size :  ${data.size}');
                    print('DataReceived');
                  }, onDone: () {
                    print("Task Done");

                    __streamController.add(packetC2SCommon.type);

                  }, onError: (error) {
                    print("Some Error");

                  });

                  __messageList.removeAt(0);
                }
                break;

              case e_packet_type.c2s_preset_comic_info:
                {
                  PacketC2SPresetComicInfo packet = packetC2SCommon as PacketC2SPresetComicInfo;

                  print("Creating a stream...");
                  Stream<void> stream = new Stream.fromFuture(packet.fetchBytes());
                  print("Created the stream");

                  stream.listen((data) {
                    //print('DataReceived - size :  ${data.size}');
                    print('DataReceived');
                  }, onDone: () {
                    print("Task Done");

                    __streamController.add(packetC2SCommon.type);

                  }, onError: (error) {
                    print("Some Error");

                  });

                  __messageList.removeAt(0);
                }
                break;

              case e_packet_type.c2s_preset_library_info:
                {
                  PacketC2SPresetLibraryInfo packet = packetC2SCommon as PacketC2SPresetLibraryInfo;

                  print("Creating a stream...");
                  Stream<void> stream = new Stream.fromFuture(packet.fetchBytes());
                  print("Created the stream");

                  stream.listen((data) {
                    //print('DataReceived - size :  ${data.size}');
                    print('DataReceived');
                  }, onDone: () {
                    print("Task Done");

                    __streamController.add(packetC2SCommon.type);

                  }, onError: (error) {
                    print("Some Error");

                  });

                  __messageList.removeAt(0);
                }
                break;

              default:
                break;
            }
          }
        }



      }


    //print('finish current time : ${timer.tick}');

  }




}