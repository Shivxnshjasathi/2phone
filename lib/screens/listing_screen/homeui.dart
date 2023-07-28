import 'dart:async';
import 'dart:convert';
import 'package:assigment1/screens/listing_screen/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  void initState() {
    fetchdata();
    fetchfilterdata();
    super.initState();
  }

  List<dynamic> items = [];

  Future fetchdata() async {
    final response = await http.get(Uri.parse(
        "https://dev2be.oruphones.com/api/v1/global/assignment/getListings?page=0&limit=16"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        items = data['listings'];
      });
    } else {
      setState(() {
        items = [];
      });
    }
  }

  List<dynamic> Filtermake = [];
  List<dynamic> Filtercondition = [];
  List<dynamic> FilterStorage = [];
  List<dynamic> Filterram = [];

  Future fetchfilterdata() async {
    final response = await http.get(Uri.parse(
        "https://dev2be.oruphones.com/api/v1/global/assignment/getFilters?isLimited=true"));
    if (response.statusCode == 200) {
      final data2 = json.decode(response.body);
      setState(() {
        Filtermake = data2["filters"]["make"];
        Filtercondition = data2["filters"]["condition"];
        FilterStorage = data2["filters"]["storage"];
        Filterram = data2["filters"]["ram"];
      });
      print(Filtermake);
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/5232583-removebg-preview.png",
              color: Colors.white,
              height: 40,
            ),
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.pin_drop,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("india",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.notification_add,
                  color: Colors.white,
                )
              ],
            ),
          ],
        ),
        backgroundColor: Colors.blueGrey.shade900,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 55,
              color: Colors.blueGrey.shade900,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const search()));
                  },
                  child: Container(
                    height: 40,
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text('Search with make and model..',
                              style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Text('Buy Top Brands',
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  contain2(
                    "https://s3n.cashify.in/cashify/brand/img/xhdpi/2e7cdc22-5a5f.jpg",
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  contain2(
                    "https://s3n.cashify.in/cashify/brand/img/xhdpi/20922c34-8afc.jpg",
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  contain2(
                    "https://s3n.cashify.in/cashify/brand/img/xhdpi/406a512d-e8dd.jpg",
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  contain2(
                    "https://s3n.cashify.in/cashify/brand/img/xhdpi/1dcd7fda-0141.jpg",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 150,
              child: PageView(
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.network(
                        "https://rukminim1.flixcart.com/fk-p-flap/1600/270/image/8a2d69109e6ce150.jpg?q=20",
                        fit: BoxFit.cover),
                  ),
                  SizedBox(
                    height: 150,
                    child: Image.network(
                        "https://rukminim1.flixcart.com/fk-p-flap/1600/270/image/8a2d69109e6ce150.jpg?q=20",
                        fit: BoxFit.cover),
                  ),
                  SizedBox(
                    height: 100,
                    child: Image.network(
                        "https://rukminim1.flixcart.com/fk-p-flap/1600/270/image/8a2d69109e6ce150.jpg?q=20",
                        fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Text('Shop By',
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  contain3(
                      "https://cdn-icons-png.flaticon.com/128/3176/3176090.png",
                      "BestSelling"),
                  const SizedBox(
                    width: 8,
                  ),
                  contain3(
                      "https://cdn-icons-png.flaticon.com/128/2807/2807696.png",
                      "Verified"),
                  const SizedBox(
                    width: 8,
                  ),
                  contain3(
                      "https://cdn-icons-png.flaticon.com/128/545/545245.png",
                      "Like New"),
                  const SizedBox(
                    width: 8,
                  ),
                  contain3(
                      "https://cdn-icons-png.flaticon.com/128/2915/2915324.png",
                      "Warranty"),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Best Deal near you',
                          style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 8,
                      ),
                      Text('india',
                          style: GoogleFonts.poppins(
                              color: Colors.yellow,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      fetchfilterdata();
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Filtter',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pop(); // Close the bottom sheet.
                                        },
                                        child: Text('Clear Filtter',
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text('Brand',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 16.0),
                                  SizedBox(
                                    height: 30,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Filtermake.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            height: 10,
                                            width: 85,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                Filtermake[index],
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text('Ram',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 16.0),
                                  SizedBox(
                                    height: 30,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Filterram.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            height: 10,
                                            width: 85,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                Filterram[index],
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text('Storage',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 16.0),
                                  SizedBox(
                                    height: 30,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: FilterStorage.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            height: 10,
                                            width: 85,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                FilterStorage[index],
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text('Condition',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 16.0),
                                  SizedBox(
                                    height: 30,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Filtercondition.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            height: 10,
                                            width: 85,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                Filtercondition[index],
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Container(
                                    height: 50,
                                    width: 380,
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey.shade900),
                                    child: Center(
                                      child: Text(
                                        "Apply",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text('Filtter',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  crossAxisCount: 2,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = items[index];
                  return Container(
                    height: 250,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Column(children: [
                        Image.network(
                          item['defaultImage']['fullImage'],
                          height: 120,
                          width: 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("₹" + item['listingNumPrice'].toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(item['model'] ?? 'data not available',
                                style: GoogleFonts.poppins(
                                    fontSize: 11, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item['deviceStorage'] ?? 'data not available',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500)),
                            Text(
                                "Condition: " + item['deviceCondition'] ??
                                    'data not available',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                item['listingLocation'] ?? 'data not available',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500)),
                            Text(item['listingDate'] ?? 'data not available',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contain2(
    String img,
  ) {
    return Container(
      height: 60,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.network(
          img,
          height: 50,
        ),
      ]),
    );
  }

  Widget contain3(String img3, String text3) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.network(
              img3,
              height: 40,
            ),
          ]),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(text3,
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
