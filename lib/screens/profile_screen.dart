import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techgebra/provider.dart';
import 'package:techgebra/storage/sharedpref.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,automaticallyImplyLeading: false,title: Center(child: Text('Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  ListTile(leading: CircleAvatar(radius: 50,backgroundImage:
                  NetworkImage('https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg'),
                  ),title:
                      Text('Hi'),

                  subtitle: Text('John Honai'),isThreeLine: true,),
             SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.category_outlined,color: Colors.white,size: 15,),
                          Text(
                            " List Products",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text('Your Informations',style: TextStyle(color: Colors.grey,fontSize: 15),),
                  ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      ListTile(leading: Icon(Icons.summarize_outlined),title: Text('Order Summary'),),
                      SizedBox(height: 20,),
                      ListTile(leading: Icon(Icons.book_online_outlined),title: Text('Address Book'),),
                      SizedBox(height: 20,),
                      ListTile(leading: Icon(Icons.edit),title: Text('Edit Profile'),),
                      SizedBox(height: 20,),
                      ListTile(leading: Icon(Icons.notifications),title: Text('Notification'),),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Text('Others',style: TextStyle(color: Colors.grey,fontSize: 15),),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      ListTile(leading: Icon(Icons.support_agent),title: Text('Support'),),
                      SizedBox(height: 20,),
                      ListTile(leading: Icon(Icons.share_rounded),title: Text('Share'),),
                      SizedBox(height: 20,),
                      ListTile(leading: Icon(Icons.info_outline),title: Text('About Us'),),
                      SizedBox(height: 20,),
                      ListTile(leading: Icon(Icons.lock_open_rounded),title: Text('Change Password'),),
                      SizedBox(height: 20,),
                      Consumer<AccountProvider>(
                        builder: (context, snapshot,_) {
                          return GestureDetector(onTap: ()async{
                              snapshot.clearUserData();
                          },child: ListTile(leading: Icon(Icons.logout),title: Text('Logout'),));
                        }
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),


              /*Expanded(
                child: ListView.builder(
                    itemCount: 10,itemBuilder: (context,index){
                  return Column(
                    children: [
                      ListTile(
                            leading: Icon(Icons.summarize_outlined),
                        title: Text('Order History'),
                      )
                    ],
                  );
                }),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
