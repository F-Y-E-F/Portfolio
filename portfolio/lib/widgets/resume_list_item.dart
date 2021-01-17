import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ResumeListItem extends StatelessWidget {

  final String name;
  final DateTime date;
  final String description;
  final String place;

  ResumeListItem(this.name,this.description,this.date,this.place);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(26, 34, 26, 22),

      margin: EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
          color: const Color(0xff202020), borderRadius: BorderRadius.circular(5)),
      width: MediaQuery.of(context).size.width / 3.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today_outlined,
                  size: 16, color: Colors.white),
              const SizedBox(width: 10),
              Text("${DateFormat('MMMM yyyy').format(date)} - Present",
                  style: theme.textTheme.headline6
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 13))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: theme.textTheme.headline3.copyWith(
                color: theme.primaryColor, fontWeight: FontWeight.w300,fontSize: 22),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: theme.textTheme.headline6.copyWith(
                color: Colors.grey, height: 1.5, letterSpacing: 0.7),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            place,
            style: theme.textTheme.headline6.copyWith(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
