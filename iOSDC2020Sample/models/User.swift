//
//  StudentUser.swift
//  iOSDC2020Sample
//
//  Created by Minami Baba on 2020/08/11.
//  Copyright © 2020 minami1389. All rights reserved.
//

import Foundation

protocol User {
    var id: String { get }
    var name: String { get }
}

struct TeacherUser: User {
    let id: String
    let name: String
}

struct StudentUser: User {
    let id: String
    let name: String
}


