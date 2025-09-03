//
//  NetworkManager.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import Foundation

enum CustomError: Error {
    case badURL
    case badServerResponse
    case decodeingError(String)
    
    var debugErrors: String {
        switch self {
        case .badURL:
            return "badURL"
        case .badServerResponse:
            return "bad Server Response"
        case .decodeingError(let error):
            return "dcoding error \(error)"
        }
    }
}

protocol NetworkManaging: AnyObject {
    func fetchData<T:Codable>(urlEndpoint: String, type: T.Type) async throws -> T
}

actor NetworkManager: NetworkManaging {
    
   private let decoderHelper: JSONDecoderHelper
    init(decoderHelper: JSONDecoderHelper = JSONDecoderHelper()) {
        self.decoderHelper = decoderHelper
    }
    
    func fetchData<T:Codable>(urlEndpoint: String, type: T.Type) async throws -> T {
        guard let urlString = URL(string: urlEndpoint) else { throw CustomError.badURL }
        let urlRequest = URLRequest(url: urlString)
        do {
            
            guard let (data,response) =  try? await URLSession.shared.data(for: urlRequest) else { throw CustomError.badServerResponse }
            guard  let httpRespance = response as? HTTPURLResponse, httpRespance.statusCode == 200 else { throw CustomError.badServerResponse }
            return try decoderHelper.decoder(type: T.self, data: data)
            
        }catch {
            throw CustomError.decodeingError(error.localizedDescription)
        }
    }
}

class JSONDecoderHelper {
    private let decoder = JSONDecoder()
    func decoder<T:Codable>(type: T.Type, data: Data) throws -> T {
            return try decoder.decode(type.self, from: data)
    }
}
