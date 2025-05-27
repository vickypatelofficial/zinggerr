import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_asset.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';

class MontessoriTrainingScreen extends StatefulWidget {
  const MontessoriTrainingScreen({super.key});

  @override
  State<MontessoriTrainingScreen> createState() =>
      _MontessoriTrainingScreenState();
}

class _MontessoriTrainingScreenState extends State<MontessoriTrainingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _mainTabController;

  @override
  void initState() {
    super.initState();
    _mainTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _mainTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 100),
          child: CustomAppBar(
            title: 'Montessori Training',
            showNotifications: (BuildContext) {},
            notificationCount: 3,
            bottom: TabBar(
              controller: _mainTabController,
              tabs: const [
                Tab(text: '0-3 Years'),
                Tab(text: '3-6 Years'),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white
                  // ignore: deprecated_member_use
                  .withOpacity(0.7),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.white,
              labelStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              overlayColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.white
                        // ignore: deprecated_member_use
                        .withOpacity(0.1); // Pressed effect color
                  }
                  return Colors.transparent; // Default
                },
              ),
              splashFactory: InkRipple.splashFactory, // Ripple effect
              padding:
                  EdgeInsets.symmetric(horizontal: 0), // Horizontal padding
              isScrollable: false,
            ),
          ),
        ),
        body: TabBarView(
          controller: _mainTabController,
          children: [
            // 0-3 Years Tab Content
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    color: AppColors.primaryColor.withOpacity(.8),
                    child: TabBar(
                      tabs: const [
                        Tab(text: 'Nido (2-14 Months)'),
                        Tab(text: 'Infant (14M-3Y)'),
                      ],
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white
                          // ignore: deprecated_member_use
                          .withOpacity(0.7),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: AppColors.white,
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      overlayColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states){
                          if (states.contains(WidgetState.pressed)) {
                            // ignore: deprecated_member_use
                            return Colors.white.withOpacity(0.1);
                          }
                          return Colors.transparent;
                        },
                      ),
                      splashFactory: InkRipple.splashFactory,
                      padding: EdgeInsets.symmetric(horizontal: 0),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Nido Tab Content
                        _buildCourseContent(),

                        // Infant Tab Content
                        _buildCourseContent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 3-6 Years Tab Content
            DefaultTabController(
              length: 5,
              child: Column(
                children: [
                  Container(
                    color: AppColors.primaryColor.withOpacity(.8),
                    child: TabBar(
                      isScrollable: true,
                      tabs: const [
                        Tab(text: 'Language'),
                        Tab(text: 'Sensorial'),
                        Tab(text: 'Practical Life'),
                        Tab(text: 'Cultural Studies'),
                        Tab(text: 'Mathematics'),
                      ],
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white
                          // ignore: deprecated_member_use
                          .withOpacity(0.7),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: AppColors.white,
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      overlayColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed)) {
                            return Colors.white
                                // ignore: deprecated_member_use
                                .withOpacity(0.1); 
                          }
                          return Colors.transparent; 
                        },
                      ),
                      splashFactory: InkRipple.splashFactory, 
                      padding: EdgeInsets.symmetric(horizontal: 0),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Language Tab Content
                        _buildCourseContent(),

                        // Sensorial Tab Content
                        _buildCourseContent(),

                        // Practical Life Tab Content
                        _buildCourseContent(),

                        // Cultural Studies Tab Content
                        _buildCourseContent(),

                        // Mathematics Tab Content
                        _buildCourseContent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Courses List",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * .3,
        ),

        Align(
          alignment: Alignment.center,
          child: Image.asset(
              height: MediaQuery.of(context).size.width * .3,
              width: MediaQuery.of(context).size.width * .3,
              AppAssets.noDataFound),
        ),
        const SizedBox(height: 24),
        Center(
          child: Text(
            "No Data Found!",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),

        const Spacer(),

      ],
    );
  }
}
