import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';

import '../utils/MPConstants.dart';

class MPTermsConditionScreen extends StatefulWidget {
  static String tag = '/MPTermsConditionScreen';

  @override
  MPTermsConditionScreenState createState() => MPTermsConditionScreenState();
}

class MPTermsConditionScreenState extends State<MPTermsConditionScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mpAppBackGroundColor,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: mpAppBackGroundColor,
        title: Text(
          "Terms and Condition",
          style: TextStyle(color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            AppButton(
              color: mpAppButtonColor,
              width: context.width(),
              child: Text('Last Update: 2018-10-06', style: boldTextStyle(color: Colors.white)),
              onTap: () {},
            ),
            16.height,
            Text(line1, style: secondaryTextStyle(color: Colors.white), maxLines: 3, overflow: TextOverflow.ellipsis),
            32.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10, width: 10, color: mpAppButtonColor).cornerRadiusWithClipRRect(10).paddingOnly(top: 4),
                8.width,
                Text(line2, maxLines: 2, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(color: Colors.white)).expand()
              ],
            ),
            8.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10, width: 10, color: mpAppButtonColor).cornerRadiusWithClipRRect(10).paddingOnly(top: 4),
                8.width,
                Text(line3, maxLines: 2, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(color: Colors.white)).expand()
              ],
            ),
            8.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10, width: 10, color: mpAppButtonColor).cornerRadiusWithClipRRect(10).paddingOnly(top: 4),
                8.width,
                Text(line4, maxLines: 2, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(color: Colors.white)).expand()
              ],
            ),
            8.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10, width: 10, color: mpAppButtonColor).cornerRadiusWithClipRRect(10).paddingOnly(top: 4),
                8.width,
                Text(line5, maxLines: 2, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(color: Colors.white)).expand()
              ],
            ),
            16.height,
            Text('Service', style: boldTextStyle(color: Colors.white.withOpacity(0.5))).center(),
            16.height,
            Text(line6, style: secondaryTextStyle(color: Colors.white)),
            8.height,
            Text(line7, style: secondaryTextStyle(color: Colors.white)),
            8.height,
            Text(line8, style: secondaryTextStyle(color: Colors.white)),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
