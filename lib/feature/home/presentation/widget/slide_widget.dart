import 'package:cook_book/feature/favorite/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../cubit/home_cubit.dart';

class SlideWidget extends StatelessWidget {
  final Widget child;
  final int id;
  final bool isFavScreen;

  const SlideWidget(
      {super.key,
      required this.child,
      required this.id,
       this.isFavScreen=false});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            deleteFav(context);

          }),
          children: [
            SlidableAction(
              onPressed: (context) {
                deleteFav(context);
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
  deleteFav(BuildContext context){
    if (isFavScreen) {
      HomeCubit.get(context).updateRecipeFavoriteStatus(id??-1,0);
      FavCubit.get(context).getFvaRecipe();
    }else{
      HomeCubit.get(context).deleteItem(id);
      HomeCubit.get(context).getRecipe();
    }
  }
}
