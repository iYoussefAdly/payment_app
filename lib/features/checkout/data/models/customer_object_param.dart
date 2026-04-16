class CustomerObjectParam {
  final String name;
  CustomerObjectParam({required this.name});
  toJson() {
    return {"name": name};
  }
}
