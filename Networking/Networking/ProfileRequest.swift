//
//  ProfileRequest.swift
//  Networking
//
//  Created by Nan Wang on 2016-10-14.
//  Copyright © 2016 Nan. All rights reserved.
//

/// Profile Request struct that represents a network request
public struct ProfileRequest: Request {

    private let name: String

    public let method: HTTPMethod = .get
    public var path: String { return "/users/\(name)" }
    public typealias Response = Profile

    public init(name: String) {
        self.name = name
    }
}
