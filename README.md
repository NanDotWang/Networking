## Simple protocol oriented networking layer with URLSession.   
```
- No 3rd party dependency

- Super lightweight networking

- Protocol oriented

- Swift 3 updated 

- Decentralized requests

- Enum Result
```

## How to use
```
- Try it out in Networking.playground 
```

## Example
```swift
ProfileRequest().send() { (result) in
    switch result {
    case let .success(profile):
        print("Success: \(profile)")
    case let .failure(error):
        print("Failure: \(error)")
    case .empty:
        print("Empty")
    }
}

Inspired by onevcat's https://github.com/MDCC2016/ProtocolNetwork.  
```
