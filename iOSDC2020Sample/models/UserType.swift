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
    
    var menus: [SupportMenu] {
        switch self {
        case .student:
            return [
                SupportMenu(title: "通知設定"),
                SupportMenu(title: "夏休みのスケジュール"),
                SupportMenu(title: "おすすめの自由研究一覧"),
                SupportMenu(title: "先生への質問フォーム")
            ]
        case .teacher:
            return [
                SupportMenu(title: "通知設定"),
                SupportMenu(title: "夏休みのスケジュール"),
                SupportMenu(title: "課題作成時のルール"),
                SupportMenu(title: "成績管理表")
            ]
        }
    }
}
