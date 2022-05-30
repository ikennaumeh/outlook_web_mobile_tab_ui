import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outlook/responsive.dart';
import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          if(Responsive.isMobile(context))BackButton(),
          IconButton(
            icon: SvgPicture.asset(
              "assets/Icons/Trash.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/Icons/Reply.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/Icons/reply_all.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/Icons/Transfer.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          Spacer(),
          if(Responsive.isDesktop(context))IconButton(
            icon: SvgPicture.asset(
              "assets/Icons/Printer.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPadding / 2),
          IconButton(
            icon: SvgPicture.asset(
              "assets/Icons/Markup.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPadding / 2),
          IconButton(
            icon: SvgPicture.asset(
              "assets/Icons/more_vertical.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPadding / 2),
        ],
      ),
    );
  }
}
