import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pollingweb/MpDetails.dart';

class UpdateMp extends StatefulWidget {
   final String id;
 
  UpdateMp({this.id});
  @override
  _UpdateMpState createState() => _UpdateMpState();
}

class _UpdateMpState extends State<UpdateMp> {
   final _formkey=GlobalKey<FormState>();
  String name;
  String _city;
  String mail;
  int contact;
  String address;
  String party;
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
    MaterialPageRoute(builder: (context) =>MPdetails(id:widget.id)),
  ); 
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
     final  CollectionReference udata2collection=Firestore.instance.collection('City/'+widget.id+'/Mpdetails');

    return Scaffold(
      appBar: AppBar(title: Text("Update MP Details", textAlign:TextAlign.center),
        backgroundColor: Colors.green,),
      body: Container(
       
        child:
      StreamBuilder(
        stream:Firestore.instance.collection('City/'+widget.id+'/Mpdetails').snapshots(),
       builder: (context, snapshot){
             return ListView.builder(
               
itemBuilder: (context, index){
               itemCount: 0;
      return Card( 
         color:Colors.green,
       margin: EdgeInsets.fromLTRB(300, 20, 300, 0),
       child:Column(
       children:<Widget>[
            TextFormField(
              initialValue: snapshot.data.documents[index]['name'],
              decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.person,color: Colors.black,),
                                          hintText: 'Enter MP name',
                                          labelText: 'Name',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
            validator:(val)=>val.isEmpty ? 'Please enter Name': null,
            onChanged: (val)=>setState(()=> name=val),
          ),
           SizedBox(height:20),
           TextFormField(
             initialValue: snapshot.data.documents[index]['E-mail'],
              decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.email,color: Colors.black,),
                                          hintText: 'Enter Email',
                                          labelText: 'Email',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
            validator:(val)=>val.isEmpty ? 'Please enter Email': null,
            onChanged: (val)=>setState(()=> mail=val),
          ),
           SizedBox(height:20),
           TextFormField(
             initialValue: snapshot.data.documents[index]['Constituency'],
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
           SizedBox(height:20),
           TextFormField(
              initialValue: snapshot.data.documents[index]['party'],
              decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.person,color: Colors.black,),
                                          hintText: 'Enter Party',
                                          labelText: 'Party',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
            validator:(val)=>val.isEmpty ? 'Please enter party': null,
            onChanged: (val)=>setState(()=> party=val),
          ),
           SizedBox(height:20),
           TextFormField(
             initialValue: snapshot.data.documents[index]['Contact'].toString(),
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
           SizedBox(height:20),
           TextFormField(
             initialValue: snapshot.data.documents[index]['Address'],
              decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.location_on,color: Colors.black,),
                                          hintText: 'Enter Address',
                                          labelText: 'Address',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
            validator:(val)=>val.isEmpty ? 'Please enter Address': null,
            onChanged: (val)=>setState(()=> address=val),
          ),

           SizedBox(height:20),
              RaisedButton(
                color:Colors.black,
           child: Text("Add details",style:TextStyle(color:Colors.white)),
            onPressed: ()async{
              _showDialog();
            
return await udata2collection.document(0.toString()).updateData({
            'Address': address,
            'Constituency':_city,
            'Contact':contact,
            'E-mail':mail,
            'name':name,
             'party':party
});
          
            }),       
           
         
       ]
     )
    
    
      );});
      
         })));
  }
}