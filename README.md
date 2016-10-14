
# Simple protocol oriented networking layer with URLSession.   

Inspired by onevcat's https://github.com/MDCC2016/ProtocolNetwork.  

Using JohnSundell's Unbox https://github.com/JohnSundell/Unbox for JSON -> Object Mapping

# Highlights
```
. Protocol oriented

. Swift 3 updated 

. Decentralized requests

. Result enum
```

# Example usage
```
ProfileRequest(name: "onevcat").send() { (result) in

    switch result {

        case .empty: print("empty")

        case .error(let error): print("error: \(error)")

        case .success(let profile as Profile): print("success: \(profile)")

        default: print("empty")
    }
}
```
