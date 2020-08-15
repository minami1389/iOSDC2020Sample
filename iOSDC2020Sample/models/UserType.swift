//
//  UserType.swift
//  iOSDC2020Sample
//
//  Created by Minami Baba on 2020/08/15.
//  Copyright © 2020 minami1389. All rights reserved.
//

import Foundation

enum UserType {
    case student
    case teacher
    
    static var current: UserType {
        #if STUDENT
        return UserType.student
        #elseif TEACHER
        return UserType.teacher
        #endif
    }
    
    var loginButtonTitle: String {
        switch self {
        case .student:
            return "生徒用ログイン"
        case .teacher:
            return "先生用ログイン"
        }
    }
}
