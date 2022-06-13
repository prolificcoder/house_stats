class AsyncData<T> {
  Status status;
  T? data;
  String? message;

  AsyncData.loading(this.message) : status = Status.loading;

  AsyncData.loaded(this.data) : status = Status.loaded;

  AsyncData.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { loading, loaded, error }
