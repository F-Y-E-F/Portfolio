import 'package:flutter/material.dart';
import '../../helpers/resume_lists.dart';
import '../../widgets/resume_list_item.dart';

class ResumeTabs extends StatelessWidget {
  final resumeLists = ResumeLists();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.7,
              child: Text(
                "Education ",
                textAlign: TextAlign.center,
                style: theme.textTheme.headline2
                    .copyWith(fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.7,
              child: Text(
                "Experience",
                textAlign: TextAlign.center,
                style: theme.textTheme.headline2
                    .copyWith(fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.7,
              height: 780,
              child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: resumeLists.getEducationsList()
                      .map((resume) => ResumeListItem(
                      resume.name,
                      resume.description,
                      resume.endTime,
                      resume.place))
                      .toList()),
            ),
            const SizedBox(
              width: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.7,
              height: 780,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: resumeLists
                    .getExperienceList()
                    .map((resume) => ResumeListItem(
                    resume.name,
                    resume.description,
                    resume.endTime,
                    resume.place))
                    .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
