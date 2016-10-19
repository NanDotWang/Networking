## Simple protocol oriented networking layer with URLSession.   

Inspired by onevcat's https://github.com/MDCC2016/ProtocolNetwork.  

Using JohnSundell's Unbox https://github.com/JohnSundell/Unbox for JSON -> Object Mapping

## Highlights
```
- Protocol oriented

- Swift 3 updated 

- Decentralized requests

- Result enum
```

## How to use
```
- Try it out in Networking.playground 
```

## Example
```swift
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
```
