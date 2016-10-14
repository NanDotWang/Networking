## Simple protocol oriented networking layer with URLSession.   

Inspired by onevcat's https://github.com/MDCC2016/ProtocolNetwork.  

Using JohnSundell's Unbox https://github.com/JohnSundell/Unbox for JSON -> Object Mapping

## Highlights
```
- Protocol oriented

- Swift 3 updated 

- Decentralized requests

- Result enum

- Dynamic framework
```

## How to use
```swift
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
```
