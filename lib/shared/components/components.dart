import 'package:flutter/material.dart';
import 'package:project/modules/web_view/web_view_screen.dart';
import 'package:project/shared/cubit/cubit.dart';

class CostumTextFormFeild extends StatelessWidget
{
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final dynamic onSubmit;
  final dynamic onChange;
  final dynamic onTap;
  final dynamic validate;
  final dynamic prefix;
  final dynamic suffix;
  final dynamic suffixPressed;
  final bool isPassword;

  CostumTextFormFeild({
    required this.label,
    required this.controller,
    required this.type,
    required this.prefix,
    this.onSubmit,
    this.onChange,
    required this.validate,
    this.onTap,
    this.suffixPressed,
    this.suffix,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: Icon(suffix),
        prefixIcon: GestureDetector(
          onTap: suffixPressed,
          child: Icon(
            prefix,
          ),
        ),
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }


}

Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children:

      [

        CircleAvatar(

          radius: 40.0,

          child: Text(

            '${model['time']}',

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children:

            [

              Text(

                '${model['title']}',

                style: TextStyle(

                  fontSize: 20.0,

                  fontWeight: FontWeight.bold,

                ),

              ),

              Text(

                '${model['date']}',

              ),

            ],

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        IconButton(

            onPressed: ()

            {

              AppCubit.get(context).updateData(

                  status: 'done',

                  id: model['id'],);

            },

            icon: Icon(

              Icons.check_box,

              color: Colors.lightGreen,

            ),),

        IconButton(

          onPressed: ()

          {

            AppCubit.get(context).updateData(

                status: 'archive',

                id: model['id']);

          },

          icon: Icon(

            Icons.archive,

            color: Colors.black38,

          ),),



      ],

    ),

  ),
  onDismissed: (direction)
  {
    AppCubit.get(context).deletData(id: model['id']);

  },
);



Widget myDivider() =>  Container(
  width: double.infinity,
  height: 1,
  color: Colors.grey[300],
);

Widget buildArticleItems(article, context) => InkWell(

  onTap: ()
  {
    NavgateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children:

      [

        Container(

          height: 140.0,

          width: 140.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image: DecorationImage(

              image: NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(



              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children:

              [

                Expanded(

                  child: Text(

                    '${article['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text(

                  '${article['publishedAt']}',

                  style: TextStyle(

                    color: Colors.grey,

                  ),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);



Widget articleBuilder(list, context) => ListView.separated(

  physics: const BouncingScrollPhysics(),
  itemBuilder: (context, index) => buildArticleItems(list[index], context),
  separatorBuilder: (context, index) => myDivider(),
  itemCount: list.length,);


void NavgateTo (context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);