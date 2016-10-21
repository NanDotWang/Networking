import Foundation
import PlaygroundSupport

/// Need this to get networking request callbacks
PlaygroundPage.current.needsIndefiniteExecution = true

/*
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
 * Get an AsyncOperation (with / without completetion handler) from the request
 */
let profileRequestOperation = ProfileRequest(name: "onevcat").asyncOperation() //{ (result) in
//    switch result {
//    case .empty:
//        print("show empty state")
//    case let .error(error):
//        print("show error state with: \(error)")
//    case let .success(profile):
//        print("show success: \(profile)")
//    }
//}

let one = AsyncBlockOperation { (finish) in
    DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
        print("One.")
        finish()
    }
}

let two = AsyncBlockOperation { (finish) in
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
        print("Two.")
        finish()
    }
}

let three = AsyncBlockOperation { (finish) in
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
        print("Three.")
        finish()
    }
}

let queue = OperationQueue()

two.addDependency(three)

one.addDependency(two)

profileRequestOperation.addDependency(one)

queue.addOperations([one, two, three, profileRequestOperation], waitUntilFinished: false)

