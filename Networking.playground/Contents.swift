
import PlaygroundSupport

/// Need this to get networking request callbacks
PlaygroundPage.current.needsIndefiniteExecution = true

/// Instantiate the ProfileRequest and call the send function
ProfileRequest(name: "onevcat").send() { (result) in
    switch result {
    case .empty:
        print("show empty state")
    case let .error(error):
        print("show error state with: \(error)")
    case let .success(profile):
        print("show success: \(profile)")
    }
}
