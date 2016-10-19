
import Foundation

/// typealias [String : Any]
public typealias AnyDict = [String: Any]

/// typealias [String : String]
public typealias StringDict = [String: String]

/// Provide Host url
public struct Host {
    static let url: URL = {
        let urlComponents = NSURLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.onevcat.com"
        return urlComponents.url!
    }()
}

/// HTTP Methods
///
/// - get:  get method
/// - post: post method
/// - put:  put methd
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

/// Result enum that holds the network request result
///
/// - success: pass unboxed object upon success
/// - error:   pass Error upon failure
/// - empty:   empty network response
public enum Result {
    case success(Unboxable)
    case error(Error)
    case empty
}


/// Request protocol that defines what a request object should have
public protocol Requestable {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: AnyDict { get }
    var headers: StringDict { get }

    /// Response that associated with different request
    associatedtype Response: Unboxable

    /// Send request function
    func send(completion: ((Result) -> Void)?)
}

// MARK: - Defualt Implementations
public extension Requestable {

    /// Default parameters
    var parameters: AnyDict {
        return AnyDict()
    }

    /// Default headers
    var headers: StringDict {
        return ["Content-Type": "application/json"]
    }

    /// Use URLSession to send a request
    ///
    /// - parameter completion: completion handler that returns a Result enum
    func send(completion: ((Result) -> Void)? = nil) {
        guard let url = URL(string: path, relativeTo: Host.url) else { return }
        let urlRequest = NSMutableURLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10)
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpMethod = method.rawValue
        if !parameters.isEmpty {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        let session = URLSession.shared
        session.dataTask(with: urlRequest as URLRequest, completionHandler: { data, response, error in

            if let error = error {
                DispatchQueue.main.async{ completion?(.error(error)) }
                return
            }

            guard
                let data = data,
                let result: Response = try? Unbox(data: data)
                else {
                    DispatchQueue.main.async{ completion?(.empty) }
                    return
            }

            DispatchQueue.main.async{ completion?(.success(result)) }
        }).resume()
    }
}
