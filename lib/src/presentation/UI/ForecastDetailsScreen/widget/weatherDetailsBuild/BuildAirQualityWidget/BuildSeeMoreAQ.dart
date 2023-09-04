

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Build See More Air Quality
class BuildSeeMoreAQ extends StatelessWidget {
  BuildSeeMoreAQ({Key? key}) : super(key: key);


  final indexes = List.generate(6, (index) => index++);

  /// indexes description
  List<String> indexesDesc  (BuildContext context) =>[
    AppLocalizations.of(context)!.good,
    AppLocalizations.of(context)!.moderate,
    AppLocalizations.of(context)!.unhealthy_for_sensitive_group,
    AppLocalizations.of(context)!.unhealthy,
    AppLocalizations.of(context)!.very_unhealthy,
    AppLocalizations.of(context)!.hazardous,
  ];

  /// indexes description in details
  List<String> indexesDescDet  (BuildContext context) => [
    AppLocalizations.of(context)!.good_desc,
    AppLocalizations.of(context)!.moderate_desc,
    AppLocalizations.of(context)!.unhealthy_for_sensitive_group_desc,
    AppLocalizations.of(context)!.unhealthy_desc,
    AppLocalizations.of(context)!.very_unhealthy_desc,
    AppLocalizations.of(context)!.hazardous_desc,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return  Table(
      columnWidths:  <int , TableColumnWidth>{
        0: FixedColumnWidth(size.width*0.05),
        1: FixedColumnWidth(size.width*0.2),
        2: const FlexColumnWidth(),
      },
      children: buildRows(context),
    );

  }

  List<TableRow> buildRows (BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18);

    return  List.generate(6, (index) => TableRow(
          children: [
            Text((index+1).toString() , style: titleSmall,),
            Text(indexesDesc(context)[index], style: titleSmall,),
            Text(indexesDescDet(context)[index] , style: titleSmall,)
          ]
      )
    );
  }
}
