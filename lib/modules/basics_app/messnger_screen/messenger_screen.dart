import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget
{
  const MessengerScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
          radius: 20.0,
        backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a-/AOh14GgHCsOmAGSOg2F3qEhOzfy-4mBwBciwk4jTZpKw=s96-c-rg-br100'),
          ),
            SizedBox(
              width: 15.0,
            ),
            Text('chat',
            style: TextStyle(
              color: Colors.black,
            ),
            ),
        ],
      ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
               Icons.camera_alt,
                color: Colors.white,
                size: 15.0,
           ),
            ),
            onPressed: (){},
          ),
          IconButton(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 15.0,
              ),
            ),
            onPressed: (){},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0,),
                  color: Colors.grey[350],
                ),
                padding: EdgeInsets.all(5,),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('Search',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index,) => buildStoryItem(),
                  separatorBuilder: (context, index,) => SizedBox(
                    width: 20.0,
                  ),
                  itemCount: 20,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context, index,) => Row(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a-/AOh14GgHCsOmAGSOg2F3qEhOzfy-4mBwBciwk4jTZpKw=s96-c-rg-br100'),
                          ),
                          CircleAvatar(
                            radius: 7.0,
                            backgroundColor: Colors.green,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('faris moh othmanfaris moh othmanfaris moh othman faris moh othmanfaris moh othmanfaris moh othman',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text('hello my name is faris ali othman',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text('02:00 pm',
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: Container(
                                    height: 7.0,
                                    width: 7.0,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder: (context, index,) => SizedBox(
                    height: 15.0,
                  ),
                  itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget buildStoryItem() => Container(
    width: 50.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a-/AOh14GgHCsOmAGSOg2F3qEhOzfy-4mBwBciwk4jTZpKw=s96-c-rg-br100'),
            ),
            CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'faris moh othman aliothman aliothman ali',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );

  Widget buildChatItem () => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a-/AOh14GgHCsOmAGSOg2F3qEhOzfy-4mBwBciwk4jTZpKw=s96-c-rg-br100'),
          ),
          CircleAvatar(
            radius: 7.0,
            backgroundColor: Colors.green,
          ),
        ],
      ),
      SizedBox(
        width: 15.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('faris moh othmanfaris moh othmanfaris moh othman faris moh othmanfaris moh othmanfaris moh othman',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text('hello my name is faris ali othman',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('02:00 pm',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    height: 7.0,
                    width: 7.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
