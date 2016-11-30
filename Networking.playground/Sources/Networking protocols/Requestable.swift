//
//  Requestable.swift
//  Networking
//
//  Created by Nan Wang on 2016-10-31.
//  Copyright © 2016 nan. All rights reserved.
//
import Foundation

/// typealias for [String : Any]
public typealias JSON = [String: Any]

/// Providing Host url
public struct Host {
    static let url: URL = {
        let urlComponents = NSURLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.myjson.com"
        return urlComponents.url!
    }()
}

/// HTTP Methods
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

/// Result enum that holds the network request result
///
/// - success: pass parsed object upon success
/// - error:   pass Error upon failure
/// - empty:   empty network response
public enum Result {
    case success(Parsable)
    case failure(Error)
    case empty
}

/// Request protocol that defines what a request object should have
public protocol Requestable {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: JSON { get }
    var headers: [String: String] { get }

    /// Response that associated with different request
    associatedtype Response: Parsable

    /// Send request function
    func send(completion: ((Result) -> Void)?)
}

// MARK: - Defualt Implementations
public extension Requestable {

    /// Default parameters
    var parameters: JSON {
        return JSON()
    }

    /// Default headers
    var headers: [String: String] {
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
                DispatchQueue.main.async{ completion?(.failure(error)) }
                return
            }

            guard
                let data = data,
                let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? JSON,
                let parsedObject = try? Response(json)
                else {
                    DispatchQueue.main.async{ completion?(.empty) }
                    return
            }

            DispatchQueue.main.async{ completion?(.success(parsedObject)) }
        }).resume()
    }
}
