import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pollingweb/HomeScreen.dart';

class FormScreen extends StatefulWidget {
  final int id;
 
  FormScreen({this.id});
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formkey=GlobalKey<FormState>();
  String name;
  String _city;
  String mail;
  int contact;
  String address;
  String constituency;
  String party;
  bool f=false;

void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Succesfully added"),
          
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
              Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) =>HomePage()),
  );
     
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog2() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Succesfully added"),
          
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
              Navigator.of(context).pop();
     
              },
            ),
          ],
        );
      },
    );
  }
  @override

  Widget build(BuildContext context) {
     
 final  CollectionReference udatacollection=Firestore.instance.collection('City');
 final  CollectionReference udata2collection=Firestore.instance.collection('City/'+widget.id.toString()+'/Mpdetails');


    return Scaffold(
   appBar: AppBar(title: Text("Add City", textAlign:TextAlign.center),
        backgroundColor: Colors.green,),
    body: SingleChildScrollView(
    child:Container(
     
     child:Card(
       color:Colors.green,
       margin: EdgeInsets.fromLTRB(300, 20, 300, 0),
      child: Form(
     key: _formkey, child:Column(children:<Widget>[
         SizedBox(height: 20,),
             SizedBox(height: 20,),
          new ListTile(
                  trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: ()async{
              _showDialog2();
              f=true;
            return await udatacollection.document(widget.id.toString()).setData({
             'cname':constituency,

});
            }),
                      title: TextFormField(
                        style:TextStyle(color:Colors.black),
              decoration: InputDecoration(
                hintText:"Add Constituency",
                
              ),
               validator:(val)=>val.isEmpty ? 'Please add Constituency': null,
            onChanged: (val)=>setState(()=> constituency=val),
            ),
                    ),
                    Divider(),
                    SizedBox(height: 20,),
               Text("Add Mp Details",style: TextStyle(fontWeight:FontWeight.w500,fontSize: 20,color:Colors.white),),

    
    Column(
       children:<Widget>[
         

            TextFormField(
              
              decoration: const InputDecoration(

                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.person,color: Colors.black,),
                                          hintText: 'Enter Mp name',
                                          labelText: 'Name',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
            validator:(val)=>val.isEmpty ? 'Please enter Name': null,
            onChanged: (val)=>setState(()=> name=val),
          ),
          SizedBox(height: 20,),
           TextFormField(
              decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.location_city,color: Colors.black,),
                                          hintText: 'Enter City ',
                                          labelText: 'City',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
            validator:(val)=>val.isEmpty ? 'Please enter City': null,
            onChanged: (val)=>setState(()=> _city=val),
           
          ),
            SizedBox(height: 20,),
           TextFormField(
              decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.flag,color: Colors.black,),
                                          hintText: 'Enter Politiacl Party',
                                          labelText: 'Party',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
            validator:(val)=>val.isEmpty ? 'Please enter Political Party': null,
            onChanged: (val)=>setState(()=> party=val),
           
          ),
                              SizedBox(height: 20,),
           TextFormField(
              decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.email,color: Colors.black),
                                          hintText: 'Enter Email',
                                          labelText: 'Email',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
            validator:(val)=>!val.contains('@') ? 'Not a valid email.' : null,
            onChanged: (val)=>setState(()=> mail=val),
          ),
          SizedBox(height: 20,),
           TextFormField(
              decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.contact_phone,color: Colors.black,),
                                          hintText: 'Enter Phone Number',
                                          labelText: 'Phone Number',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
                 keyboardType: TextInputType.number,
                 inputFormatters: <TextInputFormatter>[
                   WhitelistingTextInputFormatter.digitsOnly
    ],                     
            validator:(val)=>val.isEmpty ? 'Please enter Correct number': null,
            onChanged: (val) => setState(()=>contact= num.tryParse(val)),
          ),
          SizedBox(height: 20,),
           TextFormField(
             
              decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.local_hotel,color: Colors.black,),
                                          hintText: 'Enter Address',
                                          labelText: 'Address',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
            validator:(val)=>val.isEmpty ? 'Please enter Address': null,
            onChanged: (val)=>setState(()=> address=val),
          ),

          SizedBox(height: 20,),
              RaisedButton(
          color:Colors.black,
           child: Text("Add details",style:TextStyle(color:Colors.white)),
            onPressed: ()async{
              
         if(_formkey.currentState.validate() && f==true) 
         {  _showDialog();
       
return await udata2collection.document(0.toString()).setData({
            'Address': address,
            'Constituency':_city,
            'Contact':contact,
            'E-mail':mail,
            'name':name,
            'party':party

});}

          
            }),       
           
         
       ]
     )
    
    
      ] ),
  
    
  
      )  ) )));
  }
}