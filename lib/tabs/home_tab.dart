import 'dart:convert';
import 'package:ewallet/services/api_client.dart';
import 'package:ewallet/services/convert_currence.dart';
import 'package:ewallet/widget/contans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Country fromCountry = datas[0];
  Country toCountry = datas[1];
  double value = 1;
  Future<double> resFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestConvert();
  }

  _requestConvert() {
    resFuture = ConvertRepo().convert(
      fromCurr: fromCountry.currencey,
      toCurr: toCountry.currencey,
      value: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text("Convert Currency"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                _buildCurrencyView(fromCountry,false),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [BoxShadow(color: Colors.indigo
                              .withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3),)
                          ]
                      ),
                      child: Center(
                        child: Text("=", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600
                        ),),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          final temp = fromCountry;
                          fromCountry=toCountry;
                          toCountry=temp;
                          _requestConvert();
                        });
                      },
                      child: Container(
                        //width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.indigo[50],
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.indigo)
                        ),
                        child: Row(
                          children: [
                            Text('Switch Currencies',
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),),
                            Image.asset('assets/images/updownarrow.png'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                FutureBuilder<double>(
                    future: resFuture,
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return _buildCurrencyView(toCountry, true,res:snapshot.data);
                      }
                      return SizedBox.shrink();
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildCurrencyView(Country country,bool isDestination, {double res}) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [BoxShadow(
            color: Colors.indigo.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: ()=>_buildMenuCurrency(isDestination),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(country.urlFlag,
                      height: 30,
                      width: 50,),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(country.name,
                          style: Constants.regularDarkText,),
                        Text(country.currencey,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                          ),)
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            TextFormField(
              key: isDestination ? Key(res.toString()) : Key(value.toString()),
              initialValue: isDestination ? res.toString() : value.toString(),
              onFieldSubmitted: (val){
                if(double.parse(val)!=null){
                  setState(() {
                    value=double.parse(val);
                    _requestConvert();
                  });
                }
              },
              decoration: InputDecoration(
                hintText: '0.0',
                enabled: !isDestination,
                suffixIcon: Text(
                  country.currencey,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                suffixIconConstraints: BoxConstraints(
                    minHeight: 0, minWidth: 0),
              ),
              style: Constants.regularDarkText,
            )
          ],
        ),
      ),
    );
  }

  _buildMenuCurrency(bool isDestination){
    showCupertinoModalPopup(context: context, builder: (_)=>CupertinoActionSheet(
      actions: _buildListActions(onPressed: (index){
        setState(() {
          isDestination
          ? toCountry = datas[index]
          : fromCountry=datas[index];
          _requestConvert();
          Navigator.pop(context);
        });
      }),
      cancelButton: CupertinoActionSheetAction(child: Text("Cancle"),
        isDestructiveAction: true,
        onPressed: ()=>{
        Navigator.pop(context)
      },),
    ));
  }

  List<Widget> _buildListActions({Function(int) onPressed}){
    var listAction = List<Widget>();
    for(var i=0; i<datas.length;i++)
      {
        listAction.add(CupertinoActionSheetAction(onPressed: ()=>onPressed(i), child: Text(datas[i].name)));
      }
    return listAction;
  }

}
