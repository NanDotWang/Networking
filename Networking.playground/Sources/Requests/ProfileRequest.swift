
/// Profile Request struct that represents a network request
public struct ProfileRequest: Requestable {

    private let name: String

    public let method: HTTPMethod = .get
    public var path: String { return "/users/\(name)" }
    public typealias Response = Profile

    public init(name: String) {
        self.name = name
    }
}
