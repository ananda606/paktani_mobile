import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/data/datasources/product/product_local_data_source.dart';
import 'package:paktani_mobile/data/datasources/product/product_remote_data_source.dart';
import 'package:paktani_mobile/data/models/product/product_table.dart';
import 'package:paktani_mobile/domain/entities/product/product.dart';
import 'package:paktani_mobile/domain/entities/product/product_detail.dart';
import 'package:paktani_mobile/domain/repositories/product_repository.dart';
import 'package:paktani_mobile/common/exception.dart';
import 'package:paktani_mobile/common/failure.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Product>>> getProduct() async {
    try {
      final result = await remoteDataSource.getProducts();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure('Failed to connect to Server'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ProductDetail>> getProductDetail(int id) async {
    try {
      final result = await remoteDataSource.getProductDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Failed to connect to Server'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductRecommendations(
      int id) async {
    try {
      final result = await remoteDataSource.getProductRecommendations(id);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure('Failed to connect to Server'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getPopularProducts() async {
    try {
      final result = await remoteDataSource.getPopularProducts();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure('Failed to connect to Server'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
/*
  @override
  Future<Either<Failure, List<Product>>> getTopRatedProducts() async {
    try {
      final result = await remoteDataSource.getTopRatedProducts();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure('Failed to connect to Server'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
*/
  @override
  Future<Either<Failure, List<Product>>> searchProducts(String query) async {
    try {
      final result = await remoteDataSource.searchProducts(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure('Failed to connect to Server'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> saveWishlist(ProductDetail product) async {
    try {
      final result = await localDataSource
          .insertWishlist(ProductTable.fromEntity(product));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, String>> removeWishlist(ProductDetail product) async {
    try {
      final result = await localDataSource
          .removeWishlist(ProductTable.fromEntity(product));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> isAddedWishlist(int id) async {
    final result = await localDataSource.getProductById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<Product>>> getWishlistProducts() async {
    final result = await localDataSource.getWishlistProducts();
    return Right(result.map((data) => data.toEntity()).toList());
  }
  


  
}
