
/// Profile Request struct that represents a network request
public struct ProfileRequest: Requestable {

    public let method: HTTPMethod = .get
    public var path: String { return "/bins/2m8jd" }
    public typealias Response = Profile

    public init() { }
}
