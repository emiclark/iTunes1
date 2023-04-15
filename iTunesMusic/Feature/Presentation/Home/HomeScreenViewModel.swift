import Foundation

final class HomeScreenModel: ObservableObject {
  let artistId: Int
  let artistName: String
  let primaryGenreName: String
  let country: String
  let isStreamable: Bool
  
  init(
    artistId: Int,
    artistName: String,
    primaryGenreName: String,
    country: String,
    isStreamable: Bool
  ) {
    self.artistName = artistName
    self.primaryGenreName = primaryGenreName
    self.country = country
    self.isStreamable = isStreamable
  }
}

final class HomeScreenViewModel: ObservableObject {
  //  private(set) var accountDataProvider: InvestAccountDataProvider?
  private let homeUseCase: GetHomeUseCaseProtocol
  @Published private(set) var model: HomeScreenModel
  var homeScreenTitle: String { "All Music" }
  
  init(
    homeUseCase: GetInvestAccountUseCaseProtocol,
    model: HomeScreenModel
  ) {
    self.HomeUseCase = HomeUseCase
    self.model = model
  }
}

extension HomeScreenViewModel {
  @MainActor
  func onAppear() async {
    await loadHomeScreen()
  }

  func loadHomeScreen() async {
    guard homeDataProvider == nil else { return }
    do {
      let accountDataProvider = try await HomeUseCase.getAccountDataProvider()
      self.accountDataProvider = accountDataProvider
      model = .init(
        id: accountDataProvider.id,
        title: accountDataProvider.name,
        balance: MoneyClause(value: accountDataProvider.balance, isPositiveColor: accountDataProvider.balance >= 0),
        subHeadline: "Balance as of " + Self.balanceDateFormatter.string(from: accountDataProvider.balanceByDate)
      )
    } catch {
      Logger.log(
        .error,
        message: "Error loading invest account for \(model.id): \(error)"
      )
    }
  }
}

extension HomeScreenModel {
  var mock: HomeScreenModel {
    HomeScreenModel(
      artistId: 1,
      artistName: "Kenny G",
      primaryGenreName: "Blues",
      country: "USA",
      isStreamable: false
    )
  }
}
