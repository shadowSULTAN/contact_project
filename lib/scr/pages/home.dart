import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  List<Contact> contacts  =[];
  void initState(){
 getContactData();
 super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     drawer: Drawer (
       child: Column(
         children: [
           DrawerHeader(child:Image.network("https://w0.peakpx.com/wallpaper/613/952/HD-wallpaper-the-taj-mahal-agra-cool-history-moon-night-pink-taj-mahal-place.jpg   ")),
               SizedBox(height: 10),
           ListTile(
             leading: Icon(Icons.home_outlined),
             title: Text("Home"),

           )
         ],
       ),

     ),
     appBar: AppBar(
       title: Text("Contact Infromation", style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w300),),

       actions: [
         Icon(Icons.edit,color:Colors.blue),
         SizedBox(width: 18,),
         Icon(Icons.open_in_browser,color: Colors.blue ,),
         SizedBox(width: 24,)

       ],
     ),
     body:ListView.builder(
       itemCount: contacts.length,
       itemBuilder: (_,position) {
        Contact contact =contacts[position];
        return ListTile(
            title :Text ("${contact.displayName}"),
            subtitle : Text("${contact.phones?.map((e) => e.value).
              toList().join((","))}"),
         );
       },
     )
   );
  }

  void getContactData() async
  {
   PermissionStatus status =  await Permission.contacts.request();
   if(status == PermissionStatus.granted){
     List<Contact> contactsTemp = await ContactsService.getContacts();
     setState(() {
       contacts =contactsTemp;
     });
   }
  }
}

