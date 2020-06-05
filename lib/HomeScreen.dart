import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pollingweb/Addcity.dart';
import 'package:pollingweb/MpDetails.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int len;
  int i=0;
  @override
  Widget build(BuildContext context) {
    _count(index){

    len=index;
  }
    return Scaffold(
      appBar: AppBar(title: Text("Constituency", textAlign:TextAlign.center),
        backgroundColor: Colors.green,),
      body:
      Container(
        
        child:
       
      Row(
       mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          
         
          Expanded(
            flex:5,
            child:Card(
              margin:EdgeInsets.all(30),
              color:Colors.green,
              child:Column(children:<Widget>[Expanded(child:StreamBuilder(
        stream:Firestore.instance.collection('City').snapshots() ,
        
        builder: (context, snapshot){
             return ListView.builder(
               itemCount: snapshot.data.documents.length,
            //  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,childAspectRatio:9/2),
              itemBuilder: (context, index){
                i=i+1;
                if(snapshot.data.documents[index]['cname']!=null)
                {
                              return ListTile(
                              
              title:Row(children:<Widget>[
                    
                     Text(i.toString(),style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color:Colors.black)),
                      SizedBox(width: 70,),
                   Text(snapshot.data.documents[index]['cname'],style: TextStyle(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold,)),
                   
                   Divider(color:Colors.white), 
                   
              ]),
                   
                subtitle: _count(index),
                 onTap: (){
 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>MPdetails(id:index.toString())),
  );
                 },
                                ); }
                 else
                 {
                   return Text("Loading please wait!!!");
                 }
                 }   );
         
        },)
        
        ) ,

        RaisedButton(
          color:Colors.black,
            child: Text("Add City",style:TextStyle(color:Colors.white)),
            onPressed: (){
              if(len==null)
              {
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>FormScreen(id:len)),
  );
             }else{
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>FormScreen(id:len+1)),
  );

             } }),
            ] ))
      
        ),
        
        Expanded(
          flex:5,
          child: Container(
         
         
           
           child:
               Image.network(
  'data:image/jpeg;base64,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',
)

        ), )] )) );
  }
}