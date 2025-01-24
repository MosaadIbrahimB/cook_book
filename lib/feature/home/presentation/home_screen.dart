import 'home_import_file.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // شريط البحث
        const SearchWidget(),
        // النص الخاص بالفئات
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          sliver: SliverToBoxAdapter(
            child: CategoriesTextWidget(),
          ),
        ),
        // قائمة الفئات
        const CategoryBannerWidget(),
        // قائمة الوصفات
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeSucceed) {
              return ListRecipeWidget(recipeList: state.recipeModel);
            }
            if (state is HomeLoading) {
              return const SliverToBoxAdapter(
                child: Center(child: Text("Loading data")),
              );
            }
            return const SliverToBoxAdapter(
              child: Center(child: Text("No data")),
            );
          },
        ),
      ],
    );
  }
}


