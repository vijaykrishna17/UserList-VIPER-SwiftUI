//
//  Logger.swift
//  UserList
//
//  Created by vijay krishna on 06/11/25.
//

import Foundation
public class Base {
    func i(_ type: String) {}
}
class Logger: Base {
    init(type: String = "") {}
    override func i(_ type: String = "") {}
}
final actor InsiteLogger {
    public static let shared = InsiteLogger()
    var logger: Logger
    
    private init(logger: Logger = Logger() ) {
        self.logger = logger
    }
    
    func log(mag: String) {
        logger.i(mag)
    }
}
enum AgeCommenVar {
    case age
    case name
    var base: String  {
        switch self {
        case .age: ""
            
        case.name: ""
        }
    }
    func ageStart() async {
        await InsiteLogger.shared.log(mag: "message...")
    }
}


final class ScriptManager: @unchecked Sendable {
    static let shared = ScriptManager()
    private var name: String?
    private let barrierQueue = DispatchQueue(label: "com.scriptmanager", attributes: .concurrent)
    private init() {}
    func setName(name: String) {
        barrierQueue.async {
            self.name = name
        }
    }
    func getData(completion: @escaping @Sendable (String) -> ())  {
        barrierQueue.async {
            completion(self.name ?? "")
        }
    }
}
