import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:india_today/controllers/astroprovider.dart';
import 'package:india_today/models/talk_to_astro_model.dart';
import 'package:india_today/services/get_astro.dart';
import 'package:http/http.dart' as http;
import 'package:india_today/view/widgets/appbar.dart';
import 'package:provider/provider.dart';

class TalkToAstro extends StatefulWidget {
  const TalkToAstro({Key key}) : super(key: key);

  @override
  _TalkToAstroState createState() => _TalkToAstroState();
}

class _TalkToAstroState extends State<TalkToAstro> {
  List<AstroDetails> _astroDetails = <AstroDetails>[];

  @override
  void initState() {
    Provider.of<AstroProvider>(context, listen: false).fetchAstro();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(context),
        body: Provider.of<AstroProvider>(context, listen: true)
                .astroDetails
                .isEmpty
            ? Center(child: CircularProgressIndicator())
            : Consumer<AstroProvider>(
                builder: (context, myData, child) => ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      Datum details = myData.searchList.isEmpty
                          ? myData.astroDetails[index]
                          : myData.searchList[index];
                      if (index == 0) {
                        return Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Talk to Astrologer',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      myData.setsearch();
                                    },
                                    child: Image.asset(
                                      'assets/search.png',
                                      width: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/filter.png',
                                      width: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  PopupMenuButton(
                                      child: Image.asset(
                                        'assets/sort.png',
                                        width: 20,
                                      ),
                                      itemBuilder: (context) => [
                                            PopupMenuItem(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Sort By',
                                                    style: TextStyle(
                                                      color: Colors.orange,
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.orange,
                                                  ),
                                                ],
                                              ),
                                              value: 2,
                                            ),
                                            PopupMenuItem(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Radio(
                                                    value: 2,
                                                    groupValue:
                                                        '_radioSelected',
                                                    activeColor: Colors.pink,
                                                    onChanged: (value) {
                                                      Provider.of<AstroProvider>(
                                                              context,
                                                              listen: false)
                                                          .experHightoLow();
                                                    },
                                                  ),
                                                  Center(
                                                      child: Text(
                                                          'Experience- High to low')),
                                                ],
                                              ),
                                              value: 1,
                                            ),
                                            PopupMenuItem(
                                              child: Row(
                                                children: [
                                                  Radio(
                                                    value: 2,
                                                    groupValue:
                                                        '_radioSelected',
                                                    activeColor: Colors.pink,
                                                    onChanged: (value) {
                                                      Provider.of<AstroProvider>(
                                                              context,
                                                              listen: false)
                                                          .experLowtoHigh();
                                                    },
                                                  ),
                                                  Center(
                                                      child: Text(
                                                          'Experience- low to high')),
                                                ],
                                              ),
                                              value: 2,
                                            ),
                                            PopupMenuItem(
                                              child: Row(
                                                children: [
                                                  Radio(
                                                    value: 2,
                                                    groupValue:
                                                        '_radioSelected',
                                                    activeColor: Colors.pink,
                                                    onChanged: (value) {
                                                      Provider.of<AstroProvider>(
                                                              context,
                                                              listen: false)
                                                          .priceHightoLow();
                                                    },
                                                  ),
                                                  Center(
                                                      child: Text(
                                                          'Price- high to low')),
                                                ],
                                              ),
                                              value: 2,
                                            ),
                                            PopupMenuItem(
                                              child: Row(
                                                children: [
                                                  Radio(
                                                    value: 2,
                                                    groupValue:
                                                        '_radioSelected',
                                                    activeColor: Colors.pink,
                                                    onChanged: (value) {
                                                      Provider.of<AstroProvider>(
                                                              context,
                                                              listen: false)
                                                          .priceLowtoHigh();
                                                    },
                                                  ),
                                                  Center(
                                                      child: Text(
                                                          'Price- low to high')),
                                                ],
                                              ),
                                              value: 2,
                                            )
                                          ]),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              myData.search
                                  ? Container(
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      height: 45,
                                      // width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1.0,
                                            ),
                                          ]),
                                      child: Row(
                                        children: [
                                          IconButton(
                                              icon: Image.asset(
                                                'assets/search.png',
                                                width: 15,
                                              ),
                                              onPressed: null),
                                          Container(
                                            width: 200,
                                            child: new TextFormField(
                                              maxLines: 1,
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                              ),
                                              decoration:
                                                  new InputDecoration.collapsed(
                                                      hintText:
                                                          "Search Astrologer",
                                                      hintStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.grey
                                                            .withOpacity(0.9),
                                                      )),
                                              onChanged: (value) {
                                                myData.searchastro(value);
                                              },
                                            ),
                                          ),
                                          Spacer(),
                                          IconButton(
                                              icon: Icon(
                                                Icons.close,
                                                color: Colors.orange,
                                              ),
                                              onPressed: () {
                                                myData.setsearch();
                                              }),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        );
                      }
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                                leading: Image.network(
                                  details.images.medium.imageUrl,
                                  height: 300,
                                ),
                                title: Text(details.firstName),
                                trailing: Text(
                                    '${details.experience.toString()} Years'),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    details.aboutMe == null
                                        ? Container()
                                        : Text(
                                            details.aboutMe,
                                            maxLines: 4,
                                          ),
                                    details.languages.isEmpty
                                        ? Container()
                                        : Text(
                                            '${details.languages[0].name}${details.languages.length == 2 ? ', ${details.languages[1].name}' : ''}'),
                                    details.minimumCallDurationCharges == null
                                        ? Container()
                                        : Text(
                                            '₹${details.minimumCallDurationCharges}/min',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 12),
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.call,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Talk on Call',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            maxLines: 4,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      );
                    }),
              ));
  }
}
