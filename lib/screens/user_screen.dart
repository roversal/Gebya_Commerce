import 'dart:io';

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_theme.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/User-screen';

  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
  //_UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  double top = 0;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                stretch: true,
                expandedHeight: 220,
                flexibleSpace: LayoutBuilder(builder: (ctx, cons) {
                  top = cons.biggest.height;
                  return FlexibleSpaceBar(
                    centerTitle: true,
                    background: Image.network(
                      'https://media.istockphoto.com/photos/addis-market-in-addis-ababa-ethiopia-in-africa-picture-id1180182070?s=612x612',
                      fit: BoxFit.cover,
                    ),
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: top <= 200 ? 1.0 : 0.0,
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 12,
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/7345675/pexels-photo-7345675.jpeg?cs=srgb&dl=pexels-gift-habeshaw-7345675.jpg&fm=jpg'),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text('Robel'),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      const _userTileText(
                        text: 'User Bag',
                      ),
                      const _userTileHeightSpace(
                        height: 5,
                      ),
                      _userListTile(
                        onTap: () {},
                        lIcon: Icons.favorite,
                        color: Colors.red,
                        title: 'Wishlist',
                        tIcon: Icons.arrow_forward_ios,
                        tIconCallBack: () {},
                      ),
                      _userListTile(
                        onTap: () {},
                        lIcon: Icons.add_shopping_cart,
                        color: Colors.deepPurpleAccent,
                        title: 'Cart',
                        tIcon: Icons.arrow_forward_ios,
                        tIconCallBack: () {},
                      ),
                      const _userTileHeightSpace(height: 15),
                      const _userTileText(text: 'User Settings'),
                      const _userTileHeightSpace(height: 10),
                      Card(
                        child: Consumer<ThemeNotifier>(
                            //stream: null,
                            builder: (context, notifier, _) {
                          return SwitchListTile.adaptive(
                            secondary: notifier.isDark
                                ? Icon(Icons.dark_mode,
                                    color: Colors.amber.shade700)
                                : Icon(Icons.light_mode),
                            title: notifier.isDark
                                ? const Text('Dark Mode')
                                : const Text('Light Mode'),
                            value: notifier.isDark,
                            onChanged: (value) {
                              notifier.toggleTheme(value);
                            },
                          );
                        }),
                      ),
                      const _userTileHeightSpace(height: 5),
                      const _userTileText(text: 'User Settings'),
                      const _userTileHeightSpace(height: 10),
                      _userListTile(
                        lIcon: Icons.email,
                        color: Colors.green,
                        title: 'Email',
                        subTitle: 'Email',
                        onTap: () {},
                      ),
                      _userListTile(
                        lIcon: Icons.call,
                        color: Colors.yellow.shade700,
                        title: 'Phone Number',
                        subTitle: 'Number',
                        onTap: () {},
                      ),
                      _userListTile(
                        lIcon: Icons.local_shipping,
                        color: Colors.indigo,
                        title: 'Adress',
                        subTitle: 'Adress',
                        onTap: () {},
                      ),
                      _userListTile(
                        lIcon: Icons.watch_later,
                        color: Colors.red,
                        title: 'Join Date',
                        subTitle: 'Date',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFab() {
    double defaultMargin = Platform.isAndroid ? 270 : 250;
    double scrollStart = 230;
    double scrollEnd = scrollStart / 2;

    double top = defaultMargin;
    double scale = 1.0;

    if (_scrollController.hasClients) {
      double offSet = _scrollController.offset;
      top -= offSet;

      if (offSet < defaultMargin - scrollStart) {
        scale = 1;
      } else if (offSet < defaultMargin - scrollEnd) {
        scale = (defaultMargin - scrollEnd - offSet) / scrollEnd;
      } else
        scale = 0;
    }

    return Positioned(
      top: top,
      right: 20,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(scale),
        child: FloatingActionButton(
          child: const Icon(Icons.camera),
          onPressed: () {},
        ),
      ),
    );
  }
}

class _userListTile extends StatelessWidget {
  final IconData lIcon;
  final String title;
  final Color color;
  final String? subTitle;
  final IconData? tIcon;
  final VoidCallback? tIconCallBack;
  final VoidCallback? onTap;

  const _userListTile({
    this.subTitle,
    this.tIcon,
    this.tIconCallBack,
    this.onTap,
    Key? key,
    required this.lIcon,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          lIcon,
          color: color,
        ),
        title: Text(title),
        subtitle: subTitle == null ? null : Text(subTitle!),
        onTap: onTap,
        trailing: IconButton(
          icon: Icon(tIcon),
          onPressed: tIconCallBack,
        ),
      ),
    );
  }
}

class _userTileHeightSpace extends StatelessWidget {
  final double height;
  const _userTileHeightSpace({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class _userTileText extends StatelessWidget {
  final String text;
  const _userTileText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 25,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
