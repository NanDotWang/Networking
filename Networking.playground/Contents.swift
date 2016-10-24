import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

/*
 * Example 1
 *
 * Make a single networking request and get model back
 */
//ProfileRequest(name: "onevcat").send() { (result) in
//    switch result {
//    case .empty:
//        print("show empty state")
//    case let .error(error):
//        print("show error state with: \(error)")
//    case let .success(profile):
//        print("show success: \(profile)")
//    }
//}

/*
 * Example 2
 *
 * Queue a request into an OperationQueue
 */

/// Get an asyncOperation that does a request
let profileRequestOperation = ProfileRequest(name: "onevcat").asyncOperation() { (result) in
    switch result {
    case .empty:
        print("show empty state")
    case let .error(error):
        print("show error state with: \(error)")
    case let .success(profile):
        print("show success: \(profile)")
    }
}

/// AysncBlock operation count down 1
let one = AsyncBlockOperation { (finish) in
    DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
        print("One.")
        finish()
    }
}

/// AysncBlock operation count down 2
let two = AsyncBlockOperation { (finish) in
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
        print("Two.")
        finish()
    }
}

/// AysncBlock operation count down 3
let three = AsyncBlockOperation { (finish) in
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
        print("Three.")
        finish()
    }
}

/// initialize a OperationQueue
let queue = OperationQueue()

/// setup dependencies
two.addDependency(three)
one.addDependency(two)
profileRequestOperation.addDependency(one)

/// queue up operations
queue.addOperations([one, two, three, profileRequestOperation], waitUntilFinished: false)
