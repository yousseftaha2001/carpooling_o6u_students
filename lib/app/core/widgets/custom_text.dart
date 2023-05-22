import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyInput extends StatefulWidget {
  MyInput({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.textInputType,
    required this.function,
    this.show,
  });
  late String hint;
  late IconData icon;
  bool? show;
  late TextEditingController controller;
  late TextInputType textInputType;
  final Function(String?) function;

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  FocusNode node = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    node.addListener(() {
      setState(() {});
    });
  }

  bool obs = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          color: node.hasFocus ? Get.theme.primaryColor : Colors.grey,
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: TextField(
              controller: widget.controller,
              keyboardType: widget.textInputType,
              onChanged: widget.function,
              obscureText: widget.show == null ? false : obs,
              focusNode: node,
              style: TextStyle(
                color: Get.theme.primaryColor,
              ),
              decoration: InputDecoration(
                hintText: widget.hint,
                suffixIcon: widget.show == null
                    ? null
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            obs = !obs;
                          });
                        },
                        icon:
                            Icon(obs ? Icons.visibility : Icons.visibility_off),
                      ),
                enabledBorder: UnderlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
