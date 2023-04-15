import Foundation

public protocol GetHomeUseCaseProtocol {
  func getHomeDataProvider(for artist: String) async throws -> MusicDataProvider
}

struct getMusicUseCase: GetHomeUseCaseProtocol {
  let repository: MusicRepositoryProtocol
  let mapper: MusicEntityMapperProtocol
  
  init(repository: MusicRepositoryProtocol, mapper: MusicEntityMapperProtocol) {
    self.repository = repository
    self.mapper = mapper
  }
  
  func getHomeDataProvider(for artist: String) async throws -> MusicDataProvider {
    let entity = try await repository.getMusic(for: .music)
  }
}

//// map music Entity -> Home Model
//
//class HomeUseCase: MusicUseCaseProtocol {
//  func getMusic(for artist: MusicEntity) async throws -> [HomeModel] {
//    <#code#>
//  }
//
//
//}

protocol GetInvestAccountUseCaseProtocol {
  func getAccountDataProvider(accountId: String) async throws -> InvestAccountDataProvider
}
struct GetInvestAccountUseCase: GetInvestAccountUseCaseProtocol {
  private let repository: InvestAccountRepositoryProtocol
  private let mapper: AccountEntityModelMapperProtocol

  init(
    repository: InvestAccountRepositoryProtocol,
    mapper: AccountEntityModelMapperProtocol
  ) {
    self.repository = repository
    self.mapper = mapper
  }

  func getAccountDataProvider(accountId: String) async throws -> InvestAccountDataProvider {
    let entity = try await repository.getAccountDetail(for: accountId)
    let account = mapper.map(from: entity)
