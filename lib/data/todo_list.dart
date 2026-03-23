import 'package:hive/hive.dart';
import 'package:to_do_alpha/data/todo.dart';

/// 待办事项列表
///
/// 内部维护一个待办事项的集合。
/// 用于储存待办事项。
///
/// - [items] 可用于获取集合副本
class TodoList {
  final List<Todo> _items;

  List<Todo> get items => [..._items];

  int get length => _items.length;

  TodoList({List<Todo>? list}) : _items = list ?? <Todo>[];

  void add(Todo item) {
    assert(!_items.contains(item), "Todo already added");
    _items.add(item);
  }

  void remove(Todo item) {
    assert(_items.contains(item), "Todo not existing");
    _items.remove(item);
  }

  Todo operator [](int index) => _items[index];

  void load() {
    final box = _box();

    _items.clear();
    box.values.forEach(_items.add);
  }

  Future<void> save() async {
    final box = _box();
    
    await box.clear();
    await box.addAll(_items);
  }

  Box<Todo> _box() => Hive.box("todo");
}
