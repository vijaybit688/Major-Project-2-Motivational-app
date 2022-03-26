import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {

  const CustomTextButton({
    Key? key,
    required this.listOfUrl, this.index, this.function, this.icon,
  }) : super(key: key);

  final List<String> listOfUrl;
  final int? index;
  final Function? function;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function as void Function()?,
        child: Container(
          child: Center(
            child: icon
          ),
        ));
  }
}
class TextButtonForSettings extends StatelessWidget {

final Function? function;
final IconData? icon;
final String? string;

  const TextButtonForSettings({Key? key, this.function, this.icon, this.string}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     TextButton(onPressed: function as void Function()?, child: Row(
      children: [
        Icon(icon,color: Colors.black,size: 34,),
        SizedBox(
          width: 10,
        ),
        Text(string!,style: TextStyle(
            color: Colors.black,
            fontSize: 24
        ),),

      ],
    ));
  }
}
