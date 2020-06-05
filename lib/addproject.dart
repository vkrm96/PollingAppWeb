import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pollingweb/Projects.dart';

class AddprojectScreen extends StatefulWidget {
  int id;
  String cid;
  AddprojectScreen({this.id,this.cid});
  @override
  _AddprojectScreenState createState() => _AddprojectScreenState();
}

class _AddprojectScreenState extends State<AddprojectScreen> {
  final _formkey=GlobalKey<FormState>();
  String projectt;
  String projectd;
  String status;
  String sector;
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
    MaterialPageRoute(builder: (context) =>ProjectDetails(id:widget.cid)),
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
     final  CollectionReference udatacollection=Firestore.instance.collection('City/'+widget.cid+'/Mpdetails/'+0.toString()+'/Projects');


    return Scaffold(
      appBar: AppBar(title: Text("Add projects", textAlign:TextAlign.center),
        backgroundColor: Colors.green,),
      body:
      Container(
        
        child:Column(
          children:<Widget>[
      
      Card(
        color:Colors.green,
         margin: EdgeInsets.fromLTRB(300, 100, 300, 0),

        child:Form(

     key: _formkey,
     child: Column(
       children:<Widget>[
          SizedBox(height:20),
            TextFormField(
              decoration: const InputDecoration(
                
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.title,color: Colors.black,),
                                          hintText: 'Enter Project title',
                                          labelText: 'Project title',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
            validator:(val)=>val.isEmpty ? 'Please enter Project title': null,
            onChanged: (val)=>setState(()=> projectt=val),
          ),
          SizedBox(height:20),
           TextFormField(
              decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.pages,color: Colors.black,),
                                          hintText: 'Enter Project details',
                                          labelText: 'Project details',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
            validator:(val)=>val.isEmpty ? 'Please enter Project details': null,
            onChanged: (val)=>setState(()=>projectd=val),
          ),
          SizedBox(height:20),
            TextFormField(
            
              decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.subject,color: Colors.black,),
                                          hintText: 'Enter Sector',
                                          labelText: 'Project sector',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
            validator:(val)=>val.isEmpty ? 'Please enter Project sector': null,
            onChanged: (val)=>setState(()=>sector=val),
          ),
          SizedBox(height:20),
            TextFormField(
              decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.local_activity,color: Colors.black,),
                                          hintText: 'Enter Status of project',
                                          labelText: 'Project Status',
                                          labelStyle: TextStyle(color: Colors.black)
                                      ),
            validator:(val)=>val.isEmpty ? 'Please enter Project status': null,
            onChanged: (val)=>setState(()=>status=val),
          ),
          SizedBox(height:20),
          
         
       ]))),
      
       
       RaisedButton(
          color:Colors.black,
          child: Text("Add Project",style:TextStyle(color:Colors.white),),
            onPressed: ()async{
              
       if (_formkey.currentState.validate())

       {  
         _showDialog();
return await udatacollection.document(widget.id.toString()).setData({
            'like': 0,
            'dislike': 0,
            'project':projectt,
            'projecct details':projectd,
            'status':status,
            'sector':sector

});}

          
            },
            ),       ])) );
  }
}