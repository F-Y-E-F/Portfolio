import 'package:flutter/material.dart';
import '../../models/resume.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../helpers/resume_lists.dart';
import '../../widgets/resume_list_item.dart';

class ResumeTabs extends StatelessWidget {
  final resumeLists = ResumeLists();
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width.toString());
    final theme = Theme.of(context);
    return ScreenTypeLayout(
      mobile: _getMobileContent(theme,context),
      desktop: _getDesktopContent(theme,context),
      tablet: _getTabletContent(theme,context)
    );
  }

  Widget _getDesktopContent(ThemeData theme, BuildContext context) =>
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3.7,
                child: _getTitleText(theme,'Education'),
              ),
              const SizedBox(
                width: 25,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 3.7,
                  child:_getTitleText(theme,'Experience')),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getItemsList(resumeLists.getEducationsList(), MediaQuery.of(context).size.width / 3.7, MediaQuery.of(context).size.width > 1250 ? 850 : 1000),
              const SizedBox(
                width: 25,
              ),
              _getItemsList(resumeLists.getExperienceList(), MediaQuery.of(context).size.width / 3.7, MediaQuery.of(context).size.width > 1250 ? 850 : 1000),
            ],
          ),
        ],
      );

  Widget _getTabletContent(ThemeData theme, BuildContext context) =>
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                child: _getTitleText(theme,'Education'),
              ),
              const SizedBox(
                width: 25,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child:_getTitleText(theme,'Experience')),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getItemsList(resumeLists.getEducationsList(), MediaQuery.of(context).size.width / 2.5,MediaQuery.of(context).size.width>820 ? 920 : 1000),
              const SizedBox(
                width: 25,
              ),
              _getItemsList(resumeLists.getExperienceList(), MediaQuery.of(context).size.width / 2.5, MediaQuery.of(context).size.width>820 ? 920 : 1000),
            ],
          ),
        ],
      );

  Widget _getMobileContent(ThemeData theme, BuildContext context){
    return Column(
      children: [
        _getTitleText(theme,'Education'),
        const SizedBox(height: 25,),
        _getItemsList(resumeLists.getEducationsList(), MediaQuery.of(context).size.width -70, 800),
        const SizedBox(height: 40,),
        _getTitleText(theme,'Experience'),
        const SizedBox(height: 25,),
        _getItemsList(resumeLists.getExperienceList(), MediaQuery.of(context).size.width -70, 800)
      ],
    );
  }

  Widget _getItemsList(List<Resume> items, double width,double height)=>
    Container(
      width: width,
      height: height,
      child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: items
              .map((resume) => ResumeListItem(
              resume.name,
              resume.description,
              resume.endTime,
              resume.place))
              .toList()),
    );

  Widget _getTitleText(ThemeData theme,String text)=>
    Text(
      "Experience",
      textAlign: TextAlign.center,
      style: theme.textTheme.headline2
          .copyWith(fontWeight: FontWeight.w300),
    );

}
