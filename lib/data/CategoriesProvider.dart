import '../models/category.dart';
import '../utils/dummy_data.dart';

abstract class CategoriesProvider {
  List<Category> getAllCategories();
  Category getCategoryById(String categoryId);
}

class DummyCategoriesProvider implements CategoriesProvider {
  final List<Category> _categories = DUMMY_CATEGORIES;

  DummyCategoriesProvider._privateConstructor();

  static final DummyCategoriesProvider _instance = DummyCategoriesProvider._privateConstructor();

  factory DummyCategoriesProvider() {
    return _instance;
  }

  @override
  List<Category> getAllCategories() {
    return _categories;
  }

  @override
  Category getCategoryById(String categoryId) {
    return _categories.firstWhere(
      (element) => element.id == categoryId,
      orElse: () {
        throw StateError("category with id: $categoryId not found!");
      },
    );
  }
}
