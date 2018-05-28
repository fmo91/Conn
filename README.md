# Conn

[![CI Status](https://img.shields.io/travis/fmo91/Conn.svg?style=flat)](https://travis-ci.org/fmo91/Conn)
[![Version](https://img.shields.io/cocoapods/v/Conn.svg?style=flat)](https://cocoapods.org/pods/Conn)
[![License](https://img.shields.io/cocoapods/l/Conn.svg?style=flat)](https://cocoapods.org/pods/Conn)
[![Platform](https://img.shields.io/cocoapods/p/Conn.svg?style=flat)](https://cocoapods.org/pods/Conn)

## Introduction

When writing networking layers, it´s common to end with a lot of boilerplate or repeated code.

There are currently some libraries that one can use in order to improve code readability and to avoid writing boilerplate, but they are usually so bloated that one doesn´t use the half of what that library offers.

On the other hand, there are some other libraries that are lightweight, but they often fall short when you need more advanced functionality.

Conn is the library that resolves this issue. It is very lightweight (118 lines counting empty lines until now), but it is still highly modular while it doesn't require the developer to write any boilerplate. 

## Usage

The first thing you have to do is describing your requests as structs, classes or enums conforming to the `RequestType` protocol. For instance:

```swift
struct GetAllUsers: RequestType {
    typealias ResponseType = [User]
    var data: RequestData {
        return RequestData(path: "https://jsonplaceholder.typicode.com/users")
    }
}
```

`ResponseType` is an `associatedtype` that declares the format of the response. In this case, we expect to have an array of `User` as a response. The type associated to the request must implement `Codable` in order to be parsed. Take `User` as an example:

```swift
struct User: Codable {
    let id: Int
    let username: String
}
```

`RequestData` is a plain struct that defines the format of the request. In this case we are only defining a path (url), but `RequestData` also supports defining a http method, headers and params (body).

This is all you have to do. Then, to execute the request, `RequestType` has a method called `execute()` that actually dispatches the request:

```swift
GetAllUsers().execute(
    onSuccess: { (users: [User]) in
        // Do something with users
    },
    onError: { (error: Error) in
        // Do something with error
    }
)
```

Please note that users are already parsed as an array of `User`.

## Advanced Usage

If you need to do something more complex, use other networking library like Alamofire, or anything else, the `execute` method in `RequestType` accepts an optional argument named `dispatcher` of type `NetworkDispatcher`.

`NetworkDispatcher` is a protocol that only requires implementing a single method called `dispatch`:

```swift
public protocol NetworkDispatcher {
    func dispatch(request: RequestData, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void)
}
```

By default, `dispatch` uses `URLSessionNetworkDispatcher` that dispatches the request using `URLSession`. But you can define your own `NetworkDispatcher` as you want.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Conn is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Conn'
```

## Author

fmo91, ortizfernandomartin@gmail.com

## License

Conn is available under the MIT license. See the LICENSE file for more info.
