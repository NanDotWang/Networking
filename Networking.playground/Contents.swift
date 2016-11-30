import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

/*
 * Example
 *
 * Make a single networking request and get model back
 */
ProfileRequest().send() { (result) in
    switch result {
    case let .success(profile):
        print("\n\nSuccess: \n\n\(profile)")
    case let .failure(error):
        print("Failure: \(error)")
    case .empty:
        print("Empty")
    }
}