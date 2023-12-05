// ignore_for_file: depend_on_referenced_packages

import 'package:floor/floor.dart';
import 'package:flutter_case_yunus6116/features/movies/data/data_sources/local/DAO/movie_dao.dart';
import 'package:flutter_case_yunus6116/features/movies/data/models/movie.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

/// App Database
@Database(version: 1, entities: [MovieModel])
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;
}
