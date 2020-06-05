import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pollingweb/addproject.dart';

class ProjectDetails extends StatefulWidget {
   final String id;
   ProjectDetails({this.id});
  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {


  int len;
  @override
  Widget build(BuildContext context) {

 _count(index){

    len=index;
  }
    
   return new Scaffold(
appBar: AppBar(title: Text("Projects under current MP", textAlign:TextAlign.center),
        backgroundColor: Colors.green,),
     
      body:
     
      Container(
       
        padding: EdgeInsets.all(10),
        child:Column(
        children:<Widget>[
          
          SizedBox(height:20),
          SizedBox(height:20),
          Container(
            padding: EdgeInsets.all(20),
           child: Table(
            
                   children:[
                     TableRow(
                      
                   children: [
                   Text("Project",style: TextStyle(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold,),textAlign: TextAlign.center),
                   Text("Project Details",style: TextStyle(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold,),textAlign: TextAlign.center),
                   Text("Sector",style: TextStyle(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold,),textAlign: TextAlign.center),
                   Text("Status",style: TextStyle(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold,),textAlign: TextAlign.center),
                   
                    
                   ]) ],),),

        Expanded(child:StreamBuilder(
        stream:Firestore.instance.collection('City/'+widget.id+'/Mpdetails/'+0.toString()+'/Projects').snapshots(),
        builder: (context, snapshot){
         
             return Container(
               color:Colors.green,
               child:ListView.builder(
               itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
                if (snapshot.data.documents!=null)
                {
                return 
                
              ListTile(
                   title: 
                   
                   Table(
                     border: TableBorder.all(color: Colors.black),
 
                   children:[
                     TableRow(

                   children: [
                   
                   Text(snapshot.data.documents[index]['project'],style: TextStyle(fontSize: 20.0, color: Colors.black,),textAlign: TextAlign.center),
                   
                    Text(snapshot.data.documents[index]['projecct details'],style: TextStyle(fontSize: 20.0, color: Colors.black,),textAlign: TextAlign.center),
                
                 Text(snapshot.data.documents[index]['sector'],style: TextStyle(fontSize: 20.0, color: Colors.black,),textAlign: TextAlign.center),
                
                     Text(snapshot.data.documents[index]['status'],style: TextStyle(fontSize: 20.0, color: Colors.black),textAlign: TextAlign.center),
                  
                   
                   
                    
                   ]) ],),
                subtitle: _count(index),
                  ); }
               }));
         
        },)),
         RaisedButton(
           color:Colors.black,
            child: Text("Add Projects",style:TextStyle(color:Colors.white)),
            onPressed: (){
              if(len==null)
              {
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>AddprojectScreen(id:0,cid:widget.id)),
  );}
  else{
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>AddprojectScreen(id:len+1,cid:widget.id)),
  );
  }
            }),
        ])
   
   ) );  }
}