import '../models/category.dart';
import '../utils/dummy_data.dart';

abstract class CategoriesProvider {
  List<Category> getAllCategories();

  Category getCategoryById(String categoryId);
}

class DummyCategoriesProvider implements CategoriesProvider {
  final List<Category> _categories = DUMMY_CATEGORIES;

  @override
  List<Category> getAllCategories() {
    return _categories;
  }

  @override
  Category getCategoryById(String categoryId) {
    return _categories.firstWhere(
      (element) => element.id == "1",
      orElse: () {
        throw StateError("category with id: $categoryId not found!");
      },
    );
  }
}
