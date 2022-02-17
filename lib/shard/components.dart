import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../modules/webview.dart';

Widget defaultTextButton({
  required Function onPress,
  required String text,
}) =>
    TextButton(
        onPressed: () {
          onPress();
        },
        child: Text(text.toUpperCase()));
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
Widget defaultTextField({
  bool isPassword = false,
  required TextInputType? type,
  required TextEditingController? control,
  required String label,
  IconData? prefix,
  Function? suffixButtonPressed,
  IconData? suffix,
  onSubmitted,
  onTap,
  bool isClickable = true,
  Function? validator,
  onchange,
}) =>
    TextFormField(
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      obscureText: isPassword,
      keyboardType: type,
      controller: control,
      onFieldSubmitted: onSubmitted,
      //     (String? value) {
      //   return onSubmitted!(value);
      // },
      onTap: onTap,
      validator: (value) {
        return validator!(value);
      },
      enabled: isClickable,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefix),
          border: const OutlineInputBorder(),
          suffix: IconButton(
            onPressed: () {
              suffixButtonPressed!();
            },
            icon: Icon(
              suffix,
            ),
          )),
      onChanged: onchange,
    );

Widget buildArticleItems(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article['url']));
      },
      radius: 50,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${article['urlToImage']}'),
                  )),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120,
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${article['title']}",
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${article['publishedAt']}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
Widget myDivider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        color: Colors.grey[300],
        width: double.infinity,
        height: 0.5,
      ),
    );
Widget buildHomeItem(Map model, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen("${model["url"]}"));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage("${model["urlToImage"]}"),
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: 400,
                child: Text(
                  model['title'],
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(children: [
              Text(
                "${model['publishedAt']}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Text(
                "${model['source']["name"]}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 5,
              )
            ]),
          ],
        ),
      ),
    );
Widget conditional(list, context) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            buildArticleItems(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length),
    fallback: (context) => const Center(child: CircularProgressIndicator()));

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

/*Widget DefaultTextfiled({
  required TextEditingController control,
 TextInputType? type,
  Function? onSubmit,
  Function? onChange,
required Function validator,
required String label,
required IconData prefix,
  IconData? suffix,
  bool password=false,
 Function? OnPressed,
})
=>TextFormField(
  keyboardType: type,
controller: control,
decoration: InputDecoration(
labelText: label,
prefixIcon: Icon(
  prefix,
),
suffix: suffix !=null?  IconButton(
  icon: Icon(
  suffix,),
  onPressed:()
  {
    OnPressed!();
  },
):null,
border: OutlineInputBorder(),
  va
),
);
*/
class Button extends StatelessWidget {
  final String text;
  final Function onPress;
  final Color color;
  const Button({
    Key? key,
    required this.text,
    required this.onPress,
    this.color = Colors.blue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: color,
      child: MaterialButton(
        onPressed: () {
          onPress();
        },
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

Widget itemHomeRow(model, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen("${model["url"]}"));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: NetworkImage("${model["urlToImage"]}"),
                fit: BoxFit.cover,
                width: 200,
                height: 100,
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text("${model["title"]}",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyText2),
                ),
              )
            ],
          ),
        ),
      ),
    );
