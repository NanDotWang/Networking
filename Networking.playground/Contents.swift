
import PlaygroundSupport

/// Need this to get networking request callbacks
PlaygroundPage.current.needsIndefiniteExecution = true

/// Instantiate the ProfileRequest and call the send function
ProfileRequest(name: "onevcat").send() { (result) in
    switch result {
    case .empty:
        print("show empty state")
    case .error(let error):
        print("show error state with: \(error)")
    case .success(let profile as Profile):
        print("show success: \(profile)")
    default:
        print("show empty state")
    }
}