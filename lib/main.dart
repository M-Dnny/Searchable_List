import 'package:flutter/material.dart';
import 'package:searchable_list/model/user.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> _users = [
    User(
        'Jakob Owens',
        '@jakobowens',
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=60',
        false),
    User(
        'Craig McKay',
        '@craigmcKay',
        'https://images.unsplash.com/photo-1465984111739-03a1ee4647a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MjB8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=60',
        false),
    User(
        'Houcine Ncib',
        '@houcinencib',
        'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MjR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=60',
        false),
    User(
        'Kelly Sikkema',
        '@kellysikkema',
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60',
        false),
    User(
        'Ethan Hoover',
        '@ethanhoover',
        'https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHBlcnNvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60',
        false),
    User(
        'Mubariz Mehdizadeh',
        '@mubariz',
        'https://images.unsplash.com/photo-1502232067273-9baec0dfaf23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mjh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=60',
        false),
    User(
        'Daniel Lincoln',
        '@mrlincoln',
        'https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHBlcnNvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60',
        false),
    User(
        'Eleven',
        '@eleven',
        'https://images.unsplash.com/photo-1593104547489-5cfb3839a3b5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHBlcnNvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60',
        false),
    User(
        'Elezabeth',
        '@ele',
        'https://images.unsplash.com/photo-1569124589354-615739ae007b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fHBlcnNvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60',
        false),
    User(
        'Hannah',
        '@hannah',
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fHBlcnNvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60',
        false),
  ];

  List<User> _foundedUsers = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _foundedUsers = _users;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          height: 40,
          child: TextField(
            onChanged: (value) => onSearch(value),
            maxLines: 1,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade300,
              contentPadding: EdgeInsets.all(10),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade700,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              hintStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
              ),
              hintText: 'Search',
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        color: Colors.white,
        child: ListView.builder(
            itemCount: _foundedUsers.length,
            itemBuilder: (context, index) {
              return userComponent(user: _foundedUsers[index]);
            }),
      ),
    );
  }

  userComponent({required User user}) {
    return Card(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      color: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
      shadowColor: Colors.grey.shade200,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween
          ,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      user.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    SizedBox(height: 5),
                    Text(
                      user.username,
                      style: TextStyle(color: Colors.grey[500], fontSize: 13),
                    ),
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  user.isFollowByMe = !user.isFollowByMe;
                });
              },
              child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: user.isFollowByMe ? Colors.grey[800] : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color:
                          user.isFollowByMe ? Colors.transparent : Colors.grey),
                ),
                child: Center(
                  child: Text(
                    user.isFollowByMe ? 'Unfollow' : 'Follow',
                    style: TextStyle(
                        color: user.isFollowByMe ? Colors.white : Colors.black),
                  ),
                ),
                curve: Curves.easeIn,
              ),
            )
          ],
        ),
      ),
    );
  }
}
