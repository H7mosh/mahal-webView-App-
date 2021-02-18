import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  String header ,  desc , weblink , imageName;
  Function onTap;


  MyCard({ @required this.header , @required this.desc ,  this.weblink , this.imageName , this.onTap });
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  double h = 0.28;
  int range = 41;
  String threedot="  ...  ";
  @override
  Widget build(BuildContext context  ) {
    double heeght=MediaQuery.of(context).size.height;
    double weedth=MediaQuery.of(context).size.width;

    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0 ,bottom:8.0,right: 8.0 , left: 8.0),
        child: Container(
          height: heeght*h,
          width: weedth*0.89,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0.0, 0.2), //(x,y)
                  blurRadius: 3.0,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(18)),
            color: Color.fromRGBO(248 , 249 , 250 ,1.0),
              border: Border.all(
                color: Colors.redAccent.shade100,
                width: 0.8,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Padding(
                padding: const EdgeInsets.only(right:30.0 , top: 8.0),
                child: Container(
                  height: heeght*0.16,
                  width: weedth*0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.imageName),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Text(widget.header , style: TextStyle(fontFamily: 'Cairo' , color: Colors.red ,fontWeight: FontWeight.bold),),
              ),
              widget.desc.length  <= 40? Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Text(widget.desc , style: TextStyle(fontFamily: 'Cairo' , color: Colors.black54),),
              ) :
              InkWell(
                onTap: (){
                  setState(() {
                    h=0.38;
                    range=widget.desc.length; //Todo change the range to widget.desc
                    threedot =" ";
                    print(h);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right:8.0 , top: 0.0),
                  child: Text(widget.desc.replaceRange(range,widget.desc.length ,threedot), style: TextStyle(fontFamily: 'Cairo' , color: Colors.black54 ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
