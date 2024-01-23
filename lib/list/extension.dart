typedef DList = List<dynamic>;

extension ListSugar<E> on List<E> {
  List<T> convert<T>(T Function(E e) toElement) => map(toElement).toList();
}
