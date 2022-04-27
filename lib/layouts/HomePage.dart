import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:softcut/api/getCategory.dart';
import 'package:softcut/api/getSliderImages.dart';
import 'package:softcut/api/getUser.dart';
import 'package:softcut/functions/UserData.dart';
import 'package:softcut/layouts/SubCategory.dart';
import 'package:softcut/models/Category.dart';


const red = Color(0xffc1103a);

class HomePage extends StatefulWidget {

  @override
  _HomePage createState() => _HomePage();

}
class _HomePage extends State<HomePage> {
  String id="";
  String name="";
  String email="";
  bool login = false;
  List<Category>cList = [];

  @override
  void initState() {
    // TODO: implement initState
    _getUserDetails();
    super.initState();
  }
  _logout() {
    removeData("USER").then((value) {
      removeData("USER_DATA").then((value) {
        setState(() {
          login = false;
        /*  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              LoginPage()), (Route<dynamic> route) => false);*/
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            InkWell(
              child: UserAccountsDrawerHeader(
                accountName:  Text(name,style: TextStyle(color: Colors.white),) ,
                accountEmail: Text(email,style: TextStyle(color: Colors.white),),
                currentAccountPicture: GestureDetector(
                  onTap: () {
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: Icon(Icons.person,color: red,),
                  ),
                ),
                decoration: BoxDecoration(
                    color:red
                ),
              ),
            ),
            InkWell(
              onTap: () {
               /* Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAccount()));*/
              },
              child: ListTile(
                title: Text('HOME',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                 leading: Icon(Icons.home,color: red,),
              ),
            ),
            InkWell(
              onTap: () {
               /* Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));*/
              },
              child: ListTile(
                title: Text('CART',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                  leading: Icon(Icons.add_shopping_cart,color: red,),
              ),
            ),

            Divider(color: Colors.black,thickness:1),
            InkWell(
              onTap: () {
               /* Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TermsAndConditions()));*/
              },
              child: ListTile(
                title: Text('CONTACT US',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                 leading: Icon(Icons.person,color: red),
              ),
            ),
            InkWell(
              onTap: () {
               /* Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrivacyAndPolicy()));*/
              },
              child: ListTile(
                title: Text('RATE US',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                leading: Icon(Icons.star,color: red),
              ),
            ),
            InkWell(
              onTap: () {
              /*  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomerSupport()));*/
              },
              child: ListTile(
                title: Text('SHARE',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                 leading: Icon(Icons.share,color: red),
              ),
            ),
            Divider(color: Colors.black,thickness:1),
            InkWell(
              onTap: () {
               /* Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));*/

              },
              child: ListTile(
                title: Text('FAQ',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                leading: Icon(Icons.sms,color:red,),
              ),
            ),
            InkWell(
              onTap: () {
               /* Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));*/

              },
              child: ListTile(
                title: Text('TERMS AND CONDITIONS',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                leading: Icon(Icons.calendar_today,color:red,),
              ),
            ),
            InkWell(
              onTap: () {
               /* Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));*/
              },
              child: ListTile(
                title: Text('Privacy & Policy',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                leading: Icon(Icons.privacy_tip,color:red,),
              ),
            ),
            Divider(color: Colors.black,thickness: 1,),
            InkWell(
              onTap: () {
                _logout();
              },
              child: ListTile(
                title: Text('Logout',style: TextStyle(fontSize: 18),),
                leading: Icon(Icons.exit_to_app,color: Colors.black,),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Padding(
        padding: EdgeInsets.only(top: 2.0,right: 5.0),
        child: Container(
          height: 50,
          width: 50,
          child: Image(
            image: AssetImage("assets/image/softcutlogo.png") ,
          ),
        ),
      ),
            Icon(Icons.add_shopping_cart,color:red,size: 35,),
          ],
        ),
        backgroundColor:Colors.white,
        iconTheme: IconThemeData(color:red),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined,color:red,size: 35,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  const [
                      Text("HUBLI",style: TextStyle(fontWeight: FontWeight.w200),),
                      Text("Graceinfotech,Near.."),
                    ],
                  )
                ],
              ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left:10.0,right: 10.0),
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:red)),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(64),
                borderSide: BorderSide(color: red),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(64),
                borderSide: BorderSide(color: red),
              ),
              contentPadding: EdgeInsets.zero,
              isDense: true,
              prefixIcon: Icon(
                Icons.search,
                size: 24,
                color: red,
              ),
            ),
          ),
        ),
              SizedBox(height: 10,),
           //   Banner(),
              Container(
                child: FutureBuilder<List>(
                  future: getSliderImage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List simage = snapshot.data!;
                      List<Widget> imageSliders = simage
                          .map((e) => Container(
                        clipBehavior: Clip.hardEdge,
                        height: 156,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Image(
                            image: NetworkImage(e),
                          ),
                        ),
                      )
                      )
                          .toList();
                      return CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 0.90,
                          aspectRatio: 16 / 6,
                          enableInfiniteScroll: false,
                        ),
                        items: imageSliders,
                      );
                    }
                    return SpinKitCircle(
                      color: red,
                      size: 50,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                  child: Text("CATEGORY",style: TextStyle(fontSize:16,color: red),),
              ),
              SizedBox(height: 10,),
              Categories(),
             /* Container(
                height: 150,
                child:  GridView.builder(
                  shrinkWrap: true,
                  itemCount: 8,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.all(5),
                        child: Card(
                            semanticContainer: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(
                                        "Netra",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    )),
                              ],
                            )));
                  },
                ),
              ),*/

              /* Container(
                height: 170,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (cc, i) {
                      return Column(
                        children: [
                         Container(
                          padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          width: 100 ,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            border: Border.all(color: red,width: 1.2),
                            //color: red,
                          ),
                          child:Image.asset("assets/image/chicken.jpg",fit: BoxFit.cover,),
                        ),
                          SizedBox(height: 10,),
                          Text("Chicken"),
                        ],
                      );
                    }),
              ),*/


            /*  Container(
               // padding: EdgeInsets.all(10.0),
               height: 150,
                child: cList.length == 0 ? FutureBuilder<List<Category>>(
                  future: getCategory(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SpinKitCircle(
                        color: red,
                        size: 50,
                      );
                    }
                    if (snapshot.hasData) {
                      cList = snapshot.data!;
                      return categoryList();
                    }
                    return Container(
                      child: Text('No category',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    );
                  },
                ) : categoryList(),

              ),*/
             SecondBanner(),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("DEALS",style: TextStyle(fontSize:16,color: red),),
              ),
              SizedBox(height: 10,),
              Container(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (cc, i) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            width: 170 ,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(color: red,width: 1.2),
                              //color: red,
                            ),
                            child:Image.asset("assets/image/chicken.jpg",fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 10,),
                          Text("Chicken"),
                        ],
                      );
                    }),
              ),
             /* Container(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (cc, i) {
                      return Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                        margin: EdgeInsets.all(5.0),
                       // height: 300,
                        width: 190,
                        decoration: BoxDecoration(
                         // color: red,
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                          border: Border.all(color: red,width: 1.2),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            /*  Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => ProductDetails(products)));*/
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset("assets/image/chicken.jpg",fit: BoxFit.cover,
                                  height: 120.0,
                                  width: 160.0,
                                ),
                              ),
                              SizedBox(height: 4,),
                              Container(
                                child: Text(
                                  "1/2 kg CHICKEN & 1/2 kg PRAWNS",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children:  [
                                        Container(
                                            width: 60.0,
                                            height: 25.0,
                                            child: ElevatedButton(
                                              child: Text('Buy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
                                              style: ElevatedButton.styleFrom(
                                                primary: red,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                              ),
                                              onPressed: () {

                                              },
                                            )
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),*/
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("BEST SELLERS",style: TextStyle(fontSize:16,color: red),),
              ),
              SizedBox(height: 10,),
              Container(
                height: 170,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (cc, i) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            width: 100 ,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(color: red,width: 1.2),
                              //color: red,
                            ),
                            child:Image.asset("assets/image/chicken.jpg",fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 10),
                          Text("Chicken"),
                        ],
                      );
                    }),
              ),
              ThirdBanner(),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("OFFERS",style: TextStyle(fontSize:16,color: red),),
              ),
              SizedBox(height: 10,),
            Offers(),
            /*  Container(
                height: 170,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (cc, i) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            width: 100 ,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(color: red,width: 1.2),
                              //color: red,
                            ),
                            child:Image.asset("assets/image/chicken.jpg",fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 10),
                          Text("Chicken"),
                        ],
                      );
                    }),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  ListView categoryList() {
    return  ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: cList.length,
        itemBuilder: (cc, i) {
          return Padding(
            padding: const EdgeInsets.only(left: 5.0,right: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>  SubCategory(),
                    ));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: red, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 1),
                    child: Stack(
                      children: [
                        FutureBuilder(
                            future:getCategory(),
                            builder: (cc,snap){
                              print(snap.data.toString());
                              if(snap.hasData){
                                return Center(
                                  child: Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(cList[i].icon,)
                                  ),
                                );
                              }
                              return SizedBox();
                            }),
                      ],
                    ),
                  ),
                ),
                Text(cList[i].title,style: TextStyle(fontSize: 18,color: red),),
              ],
            ),
          );
        });
  }

 _getUserDetails(){
    checkData("USER").then((value) {
      getData("USER_DATA").then((value) {
        if (value != null) {
          var data = jsonDecode(value);
          setState(() {
            id = data['id'];
          });
        }
        getUser(id).then((value) {
          var response = value;
          if(response.statusCode == 200){
            setState(() {
              var data = response.data['data'];
              name =data["name"];
              email =data["email"];
            });
          }
        });
      });

    });

  }
}

class Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCarousel(
      widgets: const [
        CarouselItem(),
        CarouselItem(),
        CarouselItem(),
        CarouselItem(),
      ],
    );
  }
}

class CarouselItem extends StatelessWidget {
  const CarouselItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 156,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child:Image.asset("assets/image/slider.jpeg"),
      ),
    );
  }
}

class MyCarousel extends StatefulWidget {
  final List<Widget> widgets;
  final double? height;

  const MyCarousel({
    Key? key,
    required this.widgets,
    this.height,
  }) : super(key: key);

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _current = 0;

  _MyCarouselState();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CarouselSlider(
          items: widget.widgets,
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 0.92,
            aspectRatio: 16 / 6,
            enableInfiniteScroll: false,
            onPageChanged: (index, CarouselPageChangedReason reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        if (widget.widgets.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.widgets.length; i++)
                Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == i ? Colors.black : Colors.black12,
                    ))
            ],
          )
        else
          SizedBox(height: 12)
      ],
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}
class SecondBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCarousel(
      widgets: const [
        CarouselItemtwo(),
        CarouselItemtwo(),
        CarouselItemtwo(),
        CarouselItemtwo(),
      ],
    );
  }
}

class CarouselItemtwo extends StatelessWidget {
  const CarouselItemtwo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 156,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child:Image.asset("assets/image/bannertwo.jpg"),
      ),
    );
  }
}

class MyCarouseltwo extends StatefulWidget {
  final List<Widget> widgets;
  final double? height;

  const MyCarouseltwo({
    Key? key,
    required this.widgets,
    this.height,
  }) : super(key: key);

  @override
  _MyCarouseltwoState createState() => _MyCarouseltwoState();
}

class _MyCarouseltwoState extends State<MyCarouseltwo> {
  int _current = 0;

  _MyCarouseltwoState();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CarouselSlider(
          items: widget.widgets,
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 0.92,
            aspectRatio: 16 / 6,
            enableInfiniteScroll: false,
            onPageChanged: (index, CarouselPageChangedReason reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        if (widget.widgets.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.widgets.length; i++)
                Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == i ? Colors.black : Colors.black12,
                    ))
            ],
          )
        else
          SizedBox(height: 12)
      ],
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}




class ThirdBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCarousel(
      widgets: const [
        CarouselItemthree(),
        CarouselItemthree(),
        CarouselItemthree(),
        CarouselItemthree(),
      ],
    );
  }
}

class CarouselItemthree extends StatelessWidget {
  const CarouselItemthree({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 156,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child:Image.asset("assets/image/slider.jpeg"),
      ),
    );
  }
}

class MyCarouselthree extends StatefulWidget {
  final List<Widget> widgets;
  final double? height;

  const MyCarouselthree({
    Key? key,
    required this.widgets,
    this.height,
  }) : super(key: key);

  @override
  _MyCarouselthreeState createState() => _MyCarouselthreeState();
}

class _MyCarouselthreeState extends State<MyCarouselthree> {
  int _current = 0;

  _MyCarouselthreeState();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CarouselSlider(
          items: widget.widgets,
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 0.92,
            aspectRatio: 16 / 6,
            enableInfiniteScroll: false,
            onPageChanged: (index, CarouselPageChangedReason reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        if (widget.widgets.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.widgets.length; i++)
                Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == i ? Colors.black : Colors.black12,
                    ))
            ],
          )
        else
          SizedBox(height: 12)
      ],
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      shrinkWrap: true,
      itemCount: 8,
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) =>  SubCategory(),
            ));
          },
          child: Container(
              padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
          margin: EdgeInsets.all(5.0),
          //height: 100.0,
          decoration: BoxDecoration(
          color: Colors.white,
              border: Border.all(color:red),
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
          ),
          child: Image.asset("assets/image/chicken.jpg",fit: BoxFit.cover,),
          ),
        );
        /*Padding(
          // padding: EdgeInsets.only(left: 10,right: 10,bottom: 2),
           padding: EdgeInsets.all(15),
           child: Column(
             children: [
              Card(
                 semanticContainer: true,
                 shape: RoundedRectangleBorder(
                   side: BorderSide(color:red, width: 1),
                   borderRadius: BorderRadius.circular(10.0),
                 ),
                 clipBehavior: Clip.antiAlias,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:  <Widget>[
                     /*Padding(
                         padding: EdgeInsets.all(10.0),
                         child: Center(
                           child: Text("Netra",
                             style: TextStyle(fontSize: 18.0),
                           ),
                         )
                     ),*/
                     Image.asset("assets/image/chicken.jpg",fit: BoxFit.cover,),
                   ],
                 )
             ),

               Text("Chicken",
                 style: TextStyle(fontSize: 18.0),
               ),
               SizedBox(height: 10,)
              ],
           )
          );*/
      },
    );
  }
}





class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      shrinkWrap: true,
      itemCount: 8,
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) =>  SubCategory(),
            ));
          },
          child: Container(
            padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
            margin: EdgeInsets.all(5.0),
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color:red),
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,),
            child: Image.asset("assets/image/chicken.jpg",fit: BoxFit.cover,),
          ),
        );
      },
    );
  }
}