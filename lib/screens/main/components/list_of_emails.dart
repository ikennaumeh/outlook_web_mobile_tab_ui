import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outlook/components/side_menu.dart';
import 'package:outlook/models/Email.dart';
import 'package:outlook/responsive.dart';
import 'package:outlook/screens/email/email_screen.dart';
import '../../../constants.dart';
import 'email_card.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ListOfEmails extends StatefulWidget {
  const ListOfEmails({
    Key? key,
  }) : super(key: key);

  @override
  State<ListOfEmails> createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 250,
          ),
          child: SideMenu()),
      body: Container(
        color: kBgDarkColor,
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    if(!Responsive.isDesktop(context)) IconButton(onPressed: (){_scaffoldKey.currentState?.openDrawer();}, icon: Icon(Icons.menu)),
                    if(!Responsive.isDesktop(context))  SizedBox(width: 5,),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search",
                          fillColor: kBgLightColor,
                          filled: true,
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(kDefaultPadding * .75),
                            child: SvgPicture.asset(
                              "assets/Icons/Search.svg",
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/Icons/angle_down.svg",
                      width: 16,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Sort by date",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {},
                      child: SvgPicture.asset(
                        "assets/Icons/Sort.svg",
                        width: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: emails.length,
                  itemBuilder: (context, index) => EmailCard(
                    isActive: Responsive.isMobile(context) ? false : index == 0,
                    email: emails[index],
                    press: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => EmailScreen(email: emails[index],)));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
