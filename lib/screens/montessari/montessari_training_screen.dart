import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_asset.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/screens/montessari/addcouse_screen.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';
import 'package:zinggerr/widgets/custom_background_widget.dart';
import 'package:zinggerr/widgets/custom_buton.dart';

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

  final List<Course> courses = [
    Course(
      id: 'a801aba1-daf1-4a22-9618-64006a19310d',
      title: 'Montessari 0-3 course',
      imageUrl:
          'https://www.zinggerr.com/storage/courses/sz38Y569Vmbd0XmiB9vdSFfnj5DLRUhSce1nMTlR.png',
      status: false,
      rating: 0.0,
      reviewCount: 0,
    ),
    Course(
      id: 'a801aba1-daf1-4a22-9618-64006a19310d',
      title: 'Montessari 0-3 course',
      imageUrl:
          'https://www.zinggerr.com/storage/courses/sz38Y569Vmbd0XmiB9vdSFfnj5DLRUhSce1nMTlR.png',
      status: false,
      rating: 0.0,
      reviewCount: 0,
    ),
    Course(
      id: 'a801aba1-daf1-4a22-9618-64006a19310d',
      title: 'Montessari 0-3 course',
      imageUrl:
          'https://www.zinggerr.com/storage/courses/sz38Y569Vmbd0XmiB9vdSFfnj5DLRUhSce1nMTlR.png',
      status: false,
      rating: 0.0,
      reviewCount: 0,
    ),
    Course(
      id: 'a801aba1-daf1-4a22-9618-64006a19310d',
      title: 'Montessari 0-3 course',
      imageUrl:
          'https://www.zinggerr.com/storage/courses/sz38Y569Vmbd0XmiB9vdSFfnj5DLRUhSce1nMTlR.png',
      status: false,
      rating: 0.0,
      reviewCount: 0,
    ),
    Course(
      id: 'a801aba1-daf1-4a22-9618-64006a19310d',
      title: 'Montessari 0-3 course',
      imageUrl:
          'https://www.zinggerr.com/storage/courses/sz38Y569Vmbd0XmiB9vdSFfnj5DLRUhSce1nMTlR.png',
      status: false,
      rating: 0.0,
      reviewCount: 0,
    ),
    Course(
      id: 'a801aba1-daf1-4a22-9618-64006a19310d',
      title: 'Montessari 0-3 course',
      imageUrl:
          'https://www.zinggerr.com/storage/courses/sz38Y569Vmbd0XmiB9vdSFfnj5DLRUhSce1nMTlR.png',
      status: false,
      rating: 0.0,
      reviewCount: 0,
    ),
    Course(
      id: 'a801aba1-daf1-4a22-9618-64006a19310d',
      title: 'Montessari 0-3 course',
      imageUrl:
          'https://www.zinggerr.com/storage/courses/sz38Y569Vmbd0XmiB9vdSFfnj5DLRUhSce1nMTlR.png',
      status: false,
      rating: 0.0,
      reviewCount: 0,
    ),
    // Add more courses as needed
  ];

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
              padding: const EdgeInsets.symmetric(
                  horizontal: 0), // Horizontal padding
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
                        (Set<WidgetState> states) {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Courses List",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: 'Create Course',
                width: 120,
                height: 40,
                borderRadius: 5,
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return const AddCourseScreen();
                  }));
                  // Handle create course
                },
              ),
            ),
          ],
        ),

        // Align(
        //   alignment: Alignment.center,
        //   child: Image.asset(
        //       height: MediaQuery.of(context).size.width * .3,
        //       width: MediaQuery.of(context).size.width * .3,
        //       AppAssets.noDataFound),
        // ),
        // const SizedBox(height: 24),
        // Center(
        //   child: Text(
        //     "No Data Found!",
        //     style: Theme.of(context).textTheme.titleLarge,
        //   ),
        // ),
        // const Spacer(),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: PatternBackground(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      shrinkWrap: true,
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return _buildCourseCard(context, course);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildCourseCard(BuildContext context, Course course) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
    child: PatternBackground(
      child: InkWell(
        onTap: () {
          // Handle course tap
        },
        child: SizedBox(
          height: 342,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        course.imageUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: PopupMenuButton<String>(
                          icon: Icon(Icons.more_vert, color: AppColors.black),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'manage',
                              child: Row(
                                children: [
                                  Icon(Icons.edit,
                                      color: AppColors.primaryColor),
                                  const SizedBox(width: 8),
                                  Text('Manage',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  Icon(Icons.delete,
                                      color: AppColors.errorColor),
                                  const SizedBox(width: 8),
                                  Text('Delete',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'share',
                              child: Row(
                                children: [
                                  Icon(Icons.person_add,
                                      color: AppColors.primaryColor),
                                  const SizedBox(width: 8),
                                  Text('Share',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'share_link',
                              child: Row(
                                children: [
                                  Icon(Icons.share,
                                      color: AppColors.primaryColor),
                                  const SizedBox(width: 8),
                                  Text('Share Link',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                            ),
                          ],
                          onSelected: (value) {
                            // Handle menu selection
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: CustomButton(
                        text: course.status ? 'Active' : 'Inactive',
                        height: 28,
                        width: 80,
                        color: course.status
                            ? AppColors.greenLight
                            : AppColors.errorColor,
                        borderRadius: 4,
                        ontap: () {
                          // Handle status change
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Weekly sections',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.black,
                      ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '${course.rating}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(width: 8),
                    _buildStarRating(course.rating),
                    const SizedBox(width: 4),
                    Text(
                      '(${course.reviewCount})',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildStarRating(double rating) {
  int fullStars = rating.floor();
  bool hasHalfStar = (rating - fullStars) >= 0.5;
  int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      for (int i = 0; i < fullStars; i++)
        Icon(Icons.star, color: Colors.amber, size: 16),
      if (hasHalfStar) Icon(Icons.star_half, color: Colors.amber, size: 16),
      for (int i = 0; i < emptyStars; i++)
        Icon(Icons.star_border, color: Colors.amber, size: 16),
    ],
  );
}

// Course model class
class Course {
  final String id;
  final String title;
  final String imageUrl;
  final bool status;
  final double rating;
  final int reviewCount;

  Course({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.status,
    required this.rating,
    required this.reviewCount,
  });
}
