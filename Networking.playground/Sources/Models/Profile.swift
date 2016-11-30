
/// Profile model
public struct Profile: Equatable {
    let name: String
    let message: String
}

// Provide an Equatable implementation
public func ==(lhs: Profile, rhs: Profile) -> Bool {
    return lhs.name == rhs.name && lhs.message == rhs.message
}
