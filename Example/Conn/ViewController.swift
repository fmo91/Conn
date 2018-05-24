//
//  ViewController.swift
//  Conn
//
//  Created by fmo91 on 05/24/2018.
//  Copyright (c) 2018 fmo91. All rights reserved.
//

import UIKit
import Conn

struct User: Codable {
    let id: Int
    let username: String
}

struct GetAllUsers: RequestType {
    typealias ResponseType = [User]
    var data: RequestData {
        return RequestData(path: "https://jsonplaceholder.typicode.com/users")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetAllUsers().execute(
            onSuccess: { (users: [User]) in
                users.usernames.printAll()
            },
            onError: { (error: Error) in
                error.printDescription()
            }
        )
    }

}

extension Array where Element == User {
    var usernames: [String] {
        return map { $0.username }
    }
}

extension Array where Element == String {
    func printAll() {
        forEach { print("username: \($0)") }
    }
}

extension Error {
    func printDescription() {
        print(self)
    }
}
