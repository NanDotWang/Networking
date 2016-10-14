
/// Profile model
public struct Profile {
    let name: String?
    let message: String?
}

// MARK: - Using Unbox to parse JSON into Object
extension Profile: Unboxable {
    public init(unboxer: Unboxer) {
        name = unboxer.unbox(key: "name")
        message = unboxer.unbox(key: "message")
    }
}
