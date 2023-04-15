import Foundation

protocol LocalDataSourceProtocol {
  var music: MusicEntity? { get set }
}

final class LocalDataSource: LocalDataSourceProtocol {
  var music: MusicEntity?
}
