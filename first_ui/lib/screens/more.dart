import 'package:first_ui/screens/viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_ui/manage/manage_device_info.dart'; // use this to make all the widget size responsive to the device size.
import 'more_submenu_comming_soon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'service_info_submenu.dart';



class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => new _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen>  with WidgetsBindingObserver{
//  PacketC2STodayPopularComicInfo c2STodayPopularComicInfo =
//      new PacketC2STodayPopularComicInfo(); // use this to handle data


//  PacketC2SViewComic c2SViewComic = new PacketC2SViewComic(); // use this to handle data

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
//    c2STodayPopularComicInfo.generate(0, 0);   // generating packet
//    c2SViewComic.generate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state)
  {
    print('state = $state');
  }


  @override
  Widget build(BuildContext context) {
    // Todo Currently this screen is used for testing viewer
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: ManageDeviceInfo.resolutionWidth * 1.0,
                  height: ManageDeviceInfo.resolutionHeight * 0.22,
                  color: Color.fromRGBO(21, 24, 45, 1.0),
                ),
                Positioned(
                  top: ManageDeviceInfo.resolutionHeight * 0.03,
                  right: ManageDeviceInfo.resolutionWidth / 2.3,
                  child: CircleAvatar(
                    radius: ManageDeviceInfo.resolutionHeight * 0.04,
                    backgroundImage: CachedNetworkImageProvider('images/catHouse.jpg'),
                    child: Icon(Icons.person),
                  ),
                ),
                Positioned(
                  bottom: ManageDeviceInfo.resolutionHeight * 0.03,
                  left: ManageDeviceInfo.resolutionWidth * 0.23,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: ManageDeviceInfo.resolutionHeight * 0.05,
                        width: ManageDeviceInfo.resolutionWidth * 0.25,
                        child: OutlineButton(
                          highlightedBorderColor: Colors.redAccent,
                          shape: StadiumBorder(),
                          borderSide: BorderSide(color: Colors.white70),
                          onPressed: () {
                            Navigator.push<Widget>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubMenuComingSoonScreen('Redeem'),
                                ));
                          },
                          child: Text(
                            'Redeem',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ManageDeviceInfo.resolutionWidth * 0.05,
                      ),
                      SizedBox(
                        height: ManageDeviceInfo.resolutionHeight * 0.05,
                        width: ManageDeviceInfo.resolutionWidth * 0.25,
                        child: OutlineButton(
                          highlightedBorderColor: Colors.redAccent,
                          shape: StadiumBorder(),
                          borderSide: BorderSide(color: Colors.white70),
                          onPressed: () {
                            Navigator.push<Widget>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubMenuComingSoonScreen('Top-up Comi'),
                                ));
                          },
                          child: Text(
                            'Shop',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              color: Colors.white10,
              height: ManageDeviceInfo.resolutionHeight * 0.03,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.palette),
              title: Text(
                'Creator',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubMenuComingSoonScreen('Creator'),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(
                'Service Info',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceInfoSubmenuScreen('Service Info.'),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubMenuComingSoonScreen('Settings'),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(
                'About',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubMenuComingSoonScreen('Settings'),
                  ),
                );
              },
            ),

            SizedBox(
              height: ManageDeviceInfo.resolutionHeight * 0.05,
            ),
            Container(
              color: Colors.white60,
              height: ManageDeviceInfo.resolutionHeight * 0.02 ,
            ),

            MaterialButton(

              textColor: const Color(0xFF807a6b),
              padding: EdgeInsets.all(20.0),
              onPressed: (){
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubMenuComingSoonScreen('Settings'),
                  ),
                );
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Sign-Out'),
                     SizedBox(height: 5.0),
                    ],
                  ),
               ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            FlatButton(
              color: Colors.redAccent,
              onPressed: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubMenuComingSoonScreen('Settings'),
                  ),
                );
              },
              child: Text(
                "Sign-in   or   Sign-up",
              ),
            ),
            Divider(),
          ],

        ),

      ],
    );
  }
}
