/// 单个待办事项实例
///
/// 包含了名称、创建日期和完成状态。
class Todo {
  final String name;
  final DateTime createTime;
  bool completed;

  /// 根据模板创建待办事项
  ///
  /// [name] 代表名称
  /// [createTime] 代表创建日期
  /// [completed] 代表完成状态
  Todo(this.name, {required this.createTime, required this.completed});

  /// 创建一个全新的待办事项
  ///
  /// [name] 代表名称
  ///
  /// 自动生成创建日期与完成状态。
  Todo.createNew(this.name) : createTime = DateTime.now(), completed = false;
}
