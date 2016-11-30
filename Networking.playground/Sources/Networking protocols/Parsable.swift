//
//  Parsable.swift
//  Networking
//
//  Created by Nan Wang on 2016-10-31.
//  Copyright © 2016 nan. All rights reserved.
//

import Foundation

/// Protocol used to declare a model as being Parsable
public protocol Parsable {
    /// a JSON Initializer with Error Handling
    init(_ json: JSON) throws
}

/// Possible parsing errors
///
/// - missing: missing element in response json
/// - invalid: invalid data or json
public enum ParsingError: Error {
    case missing(String)
    case invalid(String, Any)
}
