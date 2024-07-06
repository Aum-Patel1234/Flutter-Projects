abstract class CategoryEvent{}

class CategoryEventGetSectionProducts extends CategoryEvent{
  final String section;

  CategoryEventGetSectionProducts({required this.section});
}