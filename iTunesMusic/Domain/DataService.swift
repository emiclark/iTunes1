import Foundation

class DataService {
  static let shared = DataService()
  fileprivate let baseURLString = "https://api.github.com/gists/public"
  fileprivate let authString = "emihclark/Ernie10003-"
  
//  static func fetchGist(completion: @escaping (Result<[Gist], Error>) -> Void) {
//    var urlComponents = URLComponents()
//    urlComponents.scheme = "https"
//    urlComponents.host = "api.github.com"
//    urlComponents.path = "/gists/public"
//
//    guard let validURL = urlComponents.url
//    else {
//      completion(.failure("url creation failed.guard" as! Error))
//      return
//    }
//    print(">> validURL: \(String(describing: validURL))")
//
//    let urlRequest = URLRequest(url: validURL)
//    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//      if let httpResponse = response as? HTTPURLResponse {
//        print("status: \(httpResponse.statusCode)")
//      }
//
//      guard let data, error == nil else {
//        completion(.failure(error!))
//        return
//      }
//
//      do {
//        let gists = try JSONDecoder().decode([Gist].self, from: data)
//        completion(.success(gists))
//      } catch let serializationError {
//        completion(.failure(serializationError))
//      }
//    }.resume()
//  }

  func createNewGist(completion: @escaping (Result<[Gist], Error>) -> Void) {
    let postComponents = createURLComponents(path: "/gists")
    guard let composedURL = postComponents.url else {
      print("URL creation failed")
      return
    }
    
    
    var postRequest = URLRequest(url: composedURL)
    postRequest.httpMethod = "POST"
    
    // basic authentication formatting
    var authStringBase64 = ""
    if let authData = authString.data(using: .utf8) {
      authStringBase64 = authData.base64EncodedString()
    }
    postRequest.setValue("Basic \(authStringBase64)", forHTTPHeaderField: "Authorization")
    postRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
    postRequest.setValue("application/json", forHTTPHeaderField: "Accept")
    
    
    let newGist = Gist(id: nil, isPublic: true, description: "new gist", files: ["testFile.txt": File(content: "yellow brick road")])
    
    do {
      let gistData = try JSONEncoder().encode(newGist)
      postRequest.httpBody = gistData
    } catch {
      print("creating gist data failed")
    }
    
    URLSession.shared.dataTask(with: postRequest) { (data, response, error) in
      if let httpResponse = response as? HTTPURLResponse {
        print("status code: \(httpResponse.statusCode)")
      }
      
      guard let validData = data, error == nil else {
        completion(.failure(error!))
        return
      }
      
      do {
        let json = try JSONSerialization.jsonObject(with: validData, options: [])
        completion(.success(json))
      } catch let serializedError {
        completion(.failure(serializedError))
      }
    }.resume()
  }
  
  func createURLComponents(path: String) -> URLComponents {
    var componentURL = URLComponents()
    componentURL.scheme = "https"
    componentURL.host = "api.github.com"
    componentURL.path = path
    return componentURL
  }
}
//==================================
// https://itunes.apple.com/search?term=maroon5&limit=5
// static let shared = DataService()
// fileprivate let baseURLString = "https://itunes.apple.com"

//static func fetchMusic(completion: @escaping (Result<Any, Error>) -> Void) {
//  var urlComponents = URLComponents()
//  // getting certificate error
//    urlComponents.scheme = "https"
//    urlComponents.host = "itunes.apple.com"
//    urlComponents.path = "/search?term=maroon5&limit=5"
//
//  guard let validURL = urlComponents.url
//  else {
//    print(">>url creation failed.guard \(String(describing: urlComponents.url))")
//    return
//  }
//
//  let urlRequest = URLRequest(url: validURL)
//  URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//    guard let data else {
//      return
//    }
//
//    if let httpResponse = response as? HTTPURLResponse {
//      print(">> API status: \(httpResponse.statusCode)")
//    }
//
//    do {
//      let json = try JSONSerialization.jsonObject(with: data)
//      print(">>json\n\(json)")
//    } catch let serializationError {
//      print(">> json serialization failed")
//      completion(.failure(serializationError))
//    }
//  }.resume()
//}

