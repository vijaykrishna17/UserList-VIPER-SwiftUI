//
//  Logger.swift
//  UserList
//
//  Created by vijay krishna on 06/11/25.
//

import Foundation
public class Base {
    func i(_type: String = "") {}
}
class Logger: Base {
    init(type: String = "") {}
   override func i(_type: String = "") {}
}
final actor InsiteLogger {
   public static var shared = InsiteLogger()
    var logger: Logger?
    private init(logger: Logger? = nil) {
        self.logger = logger}
}
enum AgeCommenVar {
    case age
    case name
    var base: String  {
        switch self {
        case .age:
        case.name:
        }
    }
    func ageStart() async {
        await InsiteLogger.shared.logger?.i(_type: "ggggggg")
    }
}
