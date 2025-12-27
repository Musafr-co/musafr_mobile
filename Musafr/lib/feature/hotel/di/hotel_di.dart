
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/core/network/data/client/api_client.dart';
import 'package:musafr/feature/hotel/data/remote/source/hotel/hotel_source.dart';
import 'package:musafr/feature/hotel/data/remote/source/hotel/hotel_source_impl.dart';
import 'package:musafr/feature/hotel/data/repository/hotel_repository_impl.dart';
import 'package:musafr/feature/hotel/domain/repository/hotel_repository.dart';

final hotelDi = [
  RepositoryProvider<HotelRemoteSource>(
    create: (context) => HotelRemoteSourceImpl(context.read<ApiClient>()),
  ),
  RepositoryProvider<HotelRepository>(
    create: (context) => HotelRepositoryImpl(context.read<HotelRemoteSource>()),
  ),
];
