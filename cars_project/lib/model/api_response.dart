class ApiResponse<T> {
  late bool ok;
  late String msg;
  late T result;

  ApiResponse.ok(this.result, {this.ok = true });

  ApiResponse.error(this.msg, {this.ok = false});
}