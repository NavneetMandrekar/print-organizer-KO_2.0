import 'package:flutter/material.dart';
import 'package:kwantapo/data/podos/Kot.dart';
import 'package:kwantapo/lang/AppLocalization.dart';
import 'package:kwantapo/ui/views/HeaderButtons.dart';
import 'package:kwantapo/ui/views/TimePassedCounter.dart';
import 'package:kwantapo/utils/lib.dart';

class HeaderWrapView extends StatelessWidget {
  const HeaderWrapView({
    Key? key,
    required this.kot,
    required this.kotIndex,
    required this.onKotSum,
  }) : super(key: key);

  final Kot kot;
  final int kotIndex;
  final void Function(int) onKotSum;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10, bottom: 4, top: 6,),
              child: Text(
                "${AppLocalization.instance.translate("received_time")} ${DateTimeUtils.getInstance.formatKotTime(kot.receivedTime!)}",
                style: TextStyles().titleStyleColored(textSize: 16),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TimePassedCounter(receivedTime: kot.receivedTime!)
          ],
        ),
        HeaderButtons(kotIndex: kotIndex, onKotSum: onKotSum, kot: kot),
      ],
    );
  }
}