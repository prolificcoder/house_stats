class ApiResponse<T> {
  Status status;
  T? data;
  String? message;

  ApiResponse.initial(this.message) : status = Status.initial;

  ApiResponse.loading(this.message) : status = Status.loading;

  ApiResponse.loaded(this.data) : status = Status.loaded;

  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { initial, loading, loaded, error }
