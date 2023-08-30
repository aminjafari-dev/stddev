abstract class ParamUsecase<T, P> {
  Future<T> call(P? params); 
}

abstract class Usecase<T> {
  Future<T> call(); 
}
