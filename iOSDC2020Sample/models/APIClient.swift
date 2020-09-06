//
//  APIClient.swift
//  iOSDC2020Sample
//
//  Created by Minami Baba on 2020/08/11.
//  Copyright © 2020 minami1389. All rights reserved.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    private init() {}
    
    private let students: [Student] = [
        Student(name: "佐藤花子"),
        Student(name: "鈴木太郎"),
        Student(name: "田中桃子"),
        Student(name: "山田次郎"),
        Student(name: "小林梅子")
    ]
    
    private var homeworks: [Homework] = [
        Homework(title: "漢字練習①"),
        Homework(title: "漢字練習②"),
        Homework(title: "計算練習①"),
        Homework(title: "計算練習②")
    ]
    
    func login(onSuccess: @escaping (Account) -> Void) {
        #if STUDENT
        onSuccess(StudentAccount())
        #elseif TEACHER
        onSuccess(TeacherAccount())
        #endif
    }
    
    func fetchStudents(onSuccess: @escaping ([Student]) -> Void) {
        onSuccess(self.students)
    }
    
    func fetchHomeworks(onSuccess: @escaping ([Homework]) -> Void) {
        onSuccess(self.homeworks)
    }
    
    func createHomework(
        account: TeacherAccount,
        title: String,
        onSuccess: @escaping () -> Void
    ) {
        // APIを呼び出す
        onSuccess()
    }
}
