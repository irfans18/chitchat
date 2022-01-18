import 'package:chitchat/theme/values.dart';
import 'package:chitchat/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    chat({required String routeName}) {
      return Column(
        children: [
          const Divider(),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, routeName),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png')
            ),
              title: Text('I like icecream', style: primaryTextStyle),
              subtitle:
                  Text('Icream is good for health', style: secondaryTextStyle),
              trailing: Text('21.00', style: secondaryTextStyle),
            ),
          ),
          // Row(
          //   children: [
          //     const CircleAvatar(
          //       backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png')
          //     ),
          //     const SizedBox(width: 10),
          //     GestureDetector(
          //       onTap: () => Navigator.pushNamed(context, routeName),
          //       child: Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               'Eevee',
          //               style: primaryTextStyle.copyWith(fontSize: 16),
          //             ),
          //             Text(
          //               'Last Message',
          //               style: secondaryTextStyle,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     Align(
          //       alignment: Alignment.topRight,
          //       child: Text(
          //         '21.00',
          //         style: secondaryTextStyle,
          //       ),
          //     ),
          //   ],
          // ),
          // // const Divider(),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: CustomAppBar(title: 'Home'),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              chat(routeName: '/chat-page'),
              chat(routeName: '/chat-page'),
              chat(routeName: '/chat-page'),
              chat(routeName: '/chat-page'),
            ],
          ),
        ),
      ),
    );
  }
}
