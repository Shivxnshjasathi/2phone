import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  final TextEditingController _modelController = TextEditingController();

  List<dynamic> items2 = [];
  List<dynamic> brand = [];

  Future<void> postData(String searchModel) async {
    const String apiUrl =
        "https://dev2be.oruphones.com/api/v1/global/assignment/searchModel";

    final response = await http.post(Uri.parse(apiUrl), body: {
      "searchModel": searchModel,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        brand = data["makes"];
        items2 = data['models'];
      });
      print(items2);
      print(brand);
    } else {
      setState(() {
        items2 = [];
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            height: 55,
            color: Colors.blueGrey.shade900,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                        controller: _modelController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Search with make and model..',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        String input = _modelController.text;
                        if (input.isNotEmpty) {
                          postData(input);
                        }
                      }),
                ],
              ),
            )),
        (items2.length != 0)
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                child: Text("Brand",
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w500)),
              )
            : SizedBox(),
        Container(
          height: 50,
          child: Center(
            child: ListView.builder(
              itemCount: brand.length,
              itemBuilder: (context, index) {
                return Center(
                  child: ListTile(
                    title: Text(
                      brand[index],
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        (items2.length != 0)
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                child: Text("Mobile Model",
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w500)),
              )
            : SizedBox(),
        Expanded(
          child: ListView.builder(
            itemCount: items2.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      items2[index],
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ]),
    );
  }
}
