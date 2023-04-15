import Foundation

public protocol MusicRepositoryProtocol {
  func getMusic(for type: TypeEntity) async throws -> MusicEntity
}

final class MusicRepository: MusicRepositoryProtocol {
//  private let remoteDataSource: InvestRemoteDataSourceProtocol
//  private var localDataSource: InvestLocalDataSourceProtocol
  private let musicMapper: MusicDataEntityMapperProtocol

  init(
//    remoteDataSource: InvestRemoteDataSourceProtocol,
//    localDataSource: InvestLocalDataSourceProtocol,
    musicMapper: MusicDataEntityMapperProtocol
  ) {
//    self.remoteDataSource = remoteDataSource
//    self.localDataSource = localDataSource
    self.musicMapper = musicMapper
  }

  func getMusic(for type: TypeEntity) async throws -> MusicEntity {
//    if let accountDetail = getLocalAccountDetail(for: accountId) {
//      return accountDetail
  }
  
  // revisit ? how is this diff from getMusic()?
  func getHome(for type: TypeEntity)  async throws -> MusicEntity {
    let data = try await fetchMusic(for: .music)
    let entity = try mapHome(data)
    return entity
  }
}

extension MusicRepository {
  func fetchMusic(for type: TypeEntity) async throws -> MusicData {
//    try await remoteDataSource.getInvestAccountDetail(accountId: accountId)
  }

  func mapHome(_ musicData: MusicData) throws -> MusicEntity {
    try musicMapper.map(from: musicData)
  }
}
