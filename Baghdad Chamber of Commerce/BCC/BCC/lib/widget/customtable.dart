import 'package:clipboard/clipboard.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';

TableRow buildrow(String name, String name2, bool check) => TableRow(children: [
      check
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: CustomText(
                  color: All.color1, data: name2, size: All.textsize),
            )
          : Container(),
      check
          ? Padding(
              padding: const EdgeInsets.all(6),
              child: CustomText(
                  color: Colors.black, data: name, size: All.textsize),
            )
          : Container(),
    ]);

TableRow rows(String name, String name2, String view, BuildContext context) =>
    TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CustomText(color: All.color1, data: name2, size: All.textsize),
      ),
      Directionality(
        textDirection: TextDirection.ltr,
        child: GestureDetector(
          onTap: () => DataServicesClass.urllauncher(view, context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: All.textsize,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ]);

TableRow dalilrows(Widget name, String name2, String view, bool check,
        BuildContext context) =>
    TableRow(children: [
      check
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomText(
                  color: All.color1, data: name2, size: All.textsize),
            )
          : Container(),
      check
          ? GestureDetector(
              onTap: () => DataServicesClass.urllauncher(view, context),
              child: Padding(padding: const EdgeInsets.all(6), child: name),
            )
          : Container(),
    ]);

TableRow copy(String name, String name2, String view) => TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child:
            CustomText(color: All.color1, data: name2, size: All.textsize - 1),
      ),
      Directionality(
        textDirection: TextDirection.ltr,
        child: ListTile(
          leading: GestureDetector(
              onTap: () async => await FlutterClipboard.copy(view),
              child: Icon(
                Icons.copy,
                color: All.color1,
              )),
          title: GestureDetector(
            onTap: () async => await FlutterClipboard.copy(view),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child:
                  CustomText(color: All.color1, data: name, size: All.textsize),
            ),
          ),
        ),
      )
    ]);
