import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staggered_gridview/screens/history_page.dart';
import 'package:staggered_gridview/screens/home_page.dart';
import 'package:staggered_gridview/screens/profile_page.dart';
import 'package:staggered_gridview/screens/wallet_page.dart';
import 'package:staggered_gridview/styles/colors.dart';
import 'package:staggered_gridview/styles/icons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentTab = 0;
  final List<Widget> pages = [
    const HomePage(),
    const ProfilePage(),
    const HistoryPage(),
    const WalletPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.textColorWhite,
        child: SvgPicture.asset(AppIcons.qrcode),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 90,
                      onPressed: () {
                        setState(() {
                          currentScreen = const HomePage();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.navhome, colorFilter: ColorFilter.mode(currentTab == 0 ? AppColors.secondaryColour : AppColors.primaryColor,BlendMode.srcIn,),),
                          Text('Home', style: GoogleFonts.poppins(color: currentTab == 0 ? AppColors.secondaryColour : AppColors.primaryColor, fontSize: 14, fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),
                    
                    MaterialButton(
                      minWidth: 120,
                      onPressed: () {
                        setState(() {
                          currentScreen = HistoryPage();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.navhistory, colorFilter: ColorFilter.mode(currentTab == 1 ? AppColors.secondaryColour : AppColors.primaryColor,BlendMode.srcIn,),),
                          Text('History', style: GoogleFonts.poppins(color: currentTab == 1 ? AppColors.secondaryColour : AppColors.primaryColor, fontSize: 14, fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),

                    MaterialButton(
                      minWidth: 120,
                      onPressed: () {
                        setState(() {
                          currentScreen = WalletPage();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.navcard, colorFilter: ColorFilter.mode(currentTab == 2 ? AppColors.secondaryColour : AppColors.primaryColor,BlendMode.srcIn,),),
                          Text('Card', style: GoogleFonts.poppins(color: currentTab == 2 ? AppColors.secondaryColour : AppColors.primaryColor, fontSize: 14, fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),

                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = ProfilePage();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.navuser, colorFilter: ColorFilter.mode(currentTab == 3 ? AppColors.secondaryColour : AppColors.primaryColor,BlendMode.srcIn,),),
                          Text('Profile', style: GoogleFonts.poppins(color: currentTab == 3 ? AppColors.secondaryColour : AppColors.primaryColor, fontSize: 14, fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}