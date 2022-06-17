import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/profil_perusahaan.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class DetailLowongan extends StatefulWidget {
  const DetailLowongan({Key? key}) : super(key: key);

  @override
  State<DetailLowongan> createState() => _DetailLowonganState();
}

class _DetailLowonganState extends State<DetailLowongan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "detailpekerjaan".tr,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primarycolor,
        leading: IconButton(
          //untuk back button
          iconSize: 30,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 8.0, 8.0, 8.0),
        child: Column(
          children: [
            // TextFormField(
            //   textInputAction: TextInputAction.search,
            //   style: Theme.of(context).textTheme.bodyText1,
            //   decoration: InputDecoration(
            //       labelText: "caripekerjaan".tr,
            //       border: OutlineInputBorder(),
            //       focusColor: Colors.grey,
            //       labelStyle:
            //           TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            //       prefixIcon: Icon(
            //         Icons.search,
            //       )),
            // ),
            Container(
              padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: primarycolor, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: MaterialButton(
                            child: Text(
                              "pekerjaan".tr,
                              style:
                                  TextStyle(fontSize: 20, color: primarycolor),
                            ),
                            onPressed: () {
                              Route route =
                                  MaterialPageRoute(builder: (context) => DetailLowongan());
                              Navigator.push(context, route);
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: MaterialButton(
                            child: Text(
                              "perusahaan".tr,
                              style:
                                  TextStyle(fontSize: 20, color: primarycolor),
                            ),
                            onPressed: () {
                              Route route =
                                  MaterialPageRoute(builder: (context) => ProfilPerusahaan());
                              Navigator.push(context, route);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey, width: 4),
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  "PT Patma Tirta Jaya",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: primarycolor),
                ),
                Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 40)),
                          Text(
                            "Web Developtment Staff",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: primarycolor),
                          ),
                        ]),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 30)),
                          Text(
                            "Surabaya, Jawa Timur",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: primarycolor),
                          ),
                        ]),
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              padding: EdgeInsets.all(15),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: primarycolor),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
