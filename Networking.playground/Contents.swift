
import PlaygroundSupport

/// Need this to get networking request callbacks
PlaygroundPage.current.needsIndefiniteExecution = true

/// Instantiate the ProfileRequest and call the send function
ProfileRequest(name: "onevcat").send() { (result) in

    switch result {

    case .empty:
        print("empty")

    case .error(let error):
        print("error: \(error)")

    case .success(let profile as Profile):
        print("success: \(profile)")

    default:
        print("empty")
    }
}
