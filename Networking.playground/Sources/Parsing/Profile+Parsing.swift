import Foundation

/// Parse Profile model
extension Profile: Parsable {

    public init(_ json: JSON) throws {
        // Extract values
        guard let name = json["name"] as? String else {
            throw ParsingError.missing("name")
        }
        guard let message = json["message"] as? String else {
            throw ParsingError.missing("message")
        }

        // Initialize properties
        self.name = name
        self.message = message
    }
}
