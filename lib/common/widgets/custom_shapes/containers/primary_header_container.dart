import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(top: -150, right: -250, child: CircularContainer(backgroundColor: AppColors.textSecondary.withOpacity(0.1))),
            Positioned(top: 100, right: -300, child: CircularContainer(backgroundColor: AppColors.textSecondary.withOpacity(0.1))),
            Positioned(top: 75, right: 200, child: CircularContainer(backgroundColor: AppColors.textSecondary.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}
