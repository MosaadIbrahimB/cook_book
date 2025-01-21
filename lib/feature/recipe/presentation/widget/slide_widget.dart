import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../home/presentation/cubit/home_cubit.dart';

class SlideWidget extends StatelessWidget {
  final Widget child;
  final int id;
  const SlideWidget({super.key, required this.child, required this.id});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            HomeCubit.get(context).deleteItem(id );
            HomeCubit.get(context).getRecipe();
          }),
          children: [
            SlidableAction(
              onPressed: (context) {
                HomeCubit.get(context).deleteItem(id );
                HomeCubit.get(context).getRecipe();
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: child);
  }
}
