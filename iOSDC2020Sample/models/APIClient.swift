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
    
    private let students = [
        StudentUser(id: "1", name: "花子"),
        StudentUser(id: "2", name: "太郎"),
        StudentUser(id: "3", name: "桃子"),
        StudentUser(id: "4", name: "次郎"),
        StudentUser(id: "5", name: "梅子")
    ]
    
    private var homeworks: [Homework] = [
        Homework(id: UUID().uuidString, studentId: "1", title: "漢字練習①", description: "漢字の練習をしましょう", isCompleted: true),
        Homework(id: UUID().uuidString, studentId: "1", title: "漢字練習②", description: "漢字の練習をしましょう", isCompleted: false),
        Homework(id: UUID().uuidString, studentId: "1", title: "計算練習①", description: "計算の練習をしましょう", isCompleted: true),
        Homework(id: UUID().uuidString, studentId: "1", title: "計算練習②", description: "計算の練習をしましょう", isCompleted: false)
    ]
    
    func login(onSuccess: @escaping (User) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [unowned self] in
            onSuccess(self.students.first!)
        }
    }
    
    func fetchStudents(onSuccess: @escaping ([StudentUser]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [unowned self] in
            onSuccess(self.students)
        }
    }
    
    func fetchHomeworks(for student: User, onSuccess: @escaping ([Homework]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [unowned self] in
            let filteredHomeworks = self.homeworks.filter { $0.studentId == student.id }
            onSuccess(filteredHomeworks)
        }
    }
    
    func completeHomework(student: StudentUser, homework: Homework, onSuccess: @escaping () -> Void) {
        let targetHomeworkIndex: Int = homeworks.firstIndex { $0.id == homework.id }!

        var targetHomework = homeworks.remove(at: targetHomeworkIndex)
        targetHomework.isCompleted = true
        
        homeworks.insert(targetHomework, at: targetHomeworkIndex)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            onSuccess()
        }
    }
    
    func addHomework(for student: StudentUser, teacher: TeacherUser, title: String, description: String, onSuccess: @escaping () -> Void) {
        let homework = Homework(
            id: UUID().uuidString,
            studentId: student.id,
            title: title,
            description: description,
            isCompleted: false
        )
        self.homeworks.append(homework)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            onSuccess()
        }
    }
}
