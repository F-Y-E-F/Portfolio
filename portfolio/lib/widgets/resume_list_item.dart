import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ResumeListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
          color: Color(0xff202020), borderRadius: BorderRadius.circular(5)),
      width: MediaQuery.of(context).size.width / 3.7,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(26, 30, 26, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today_outlined,
                    size: 16, color: Colors.white),
                const SizedBox(width: 7),
                Text("June 2019",
                    style: theme.textTheme.headline6
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 13))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Primary school in somewhere",
              style: theme.textTheme.headline3.copyWith(
                  color: theme.primaryColor, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nDuis semper diam at lacus condimentum, id efficitur.\nNullam ornare dignissim nibh ac tempus.",
              style: theme.textTheme.headline6.copyWith(
                  color: Colors.grey, height: 1.5, letterSpacing: 0.7),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Somewhere",
              style: theme.textTheme.headline6.copyWith(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
