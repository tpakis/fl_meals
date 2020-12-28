import '../utils/dummy_data.dart';
import '../models/meal.dart';

abstract class MealsProvider {
  List<Meal> getAllMeals();

  Meal getMealById(String mealId);

  List<Meal> getAllMealsByCategoryId(String categoryId);
}

class DummyMealsProvider implements MealsProvider {
  final List<Meal> _meals = DUMMY_MEALS;

  DummyMealsProvider._privateConstructor();

  static final DummyMealsProvider _instance =
      DummyMealsProvider._privateConstructor();

  factory DummyMealsProvider() {
    return _instance;
  }

  @override
  List<Meal> getAllMeals() {
    return _meals;
  }

  @override
  Meal getMealById(String mealId) {
    return _meals.firstWhere(
      (element) => element.id == mealId,
      orElse: () {
        throw StateError("Meal with id: $mealId not found!");
      },
    );
  }

  @override
  List<Meal> getAllMealsByCategoryId(String categoryId) {
    return _meals
        .where(
            (element) => element.belongingCategories.contains(categoryId))
        .toList();
  }
}
