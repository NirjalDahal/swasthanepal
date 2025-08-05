import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop ?? tablet ?? mobile;
        } else if (constraints.maxWidth >= 650) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final VoidCallback? onBackPressed;
  final bool showAccountButton;
  final bool showLogoutButton;

  const ResponsiveAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor,
    this.onBackPressed,
    this.showAccountButton = true,
    this.showLogoutButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return _buildDesktopAppBar(context);
        } else {
          return _buildMobileAppBar(context);
        }
      },
    );
  }

  Widget _buildMobileAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.0),
        ),
      ),
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.teal,
              ),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      actions: [
        if (showAccountButton)
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Ellipse 4.png'),
              radius: 20,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Account()),
              );
            },
          ),
        if (showLogoutButton)
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.red),
            onPressed: () => _showLogoutDialog(context),
          ),
        if (actions != null) ...actions!,
      ],
    );
  }

  Widget _buildDesktopAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          if (showBackButton)
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.teal),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: 0,
      actions: [
        // Desktop navigation menu
        if (showAccountButton)
          TextButton.icon(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Ellipse 4.png'),
              radius: 16,
            ),
            label: Text('Account'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Account()),
              );
            },
          ),
        if (showLogoutButton)
          TextButton.icon(
            icon: Icon(Icons.exit_to_app, color: Colors.red),
            label: Text('Logout'),
            onPressed: () => _showLogoutDialog(context),
          ),
        if (actions != null) ...actions!,
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/onboarding',
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? maxWidth;

  const ResponsiveContainer({
    Key? key,
    required this.child,
    this.padding,
    this.maxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double containerWidth = maxWidth ?? 1200;
        
        if (width < containerWidth) {
          return Container(
            width: width,
            padding: padding ?? EdgeInsets.all(16),
            child: child,
          );
        } else {
          return Center(
            child: Container(
              width: containerWidth,
              padding: padding ?? EdgeInsets.all(16),
              child: child,
            ),
          );
        }
      },
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  const ResponsiveGrid({
    Key? key,
    required this.children,
    this.childAspectRatio = 1.0,
    this.crossAxisSpacing = 16.0,
    this.mainAxisSpacing = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;
        
        if (constraints.maxWidth >= 1200) {
          crossAxisCount = 4; // Desktop: 4 columns
        } else if (constraints.maxWidth >= 800) {
          crossAxisCount = 3; // Tablet: 3 columns
        } else if (constraints.maxWidth >= 600) {
          crossAxisCount = 2; // Large mobile: 2 columns
        } else {
          crossAxisCount = 1; // Mobile: 1 column
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
          ),
          itemCount: children.length,
          itemBuilder: (context, index) => children[index],
        );
      },
    );
  }
} 