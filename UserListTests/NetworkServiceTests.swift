//
//  NetworkServiceTests.swift
//  UserListTests
//
//  Created by vijay krishna on 04/09/25.
//


@testable import UserList
import XCTest

final class NetworkServiceTests: XCTestCase {
    
    var mockNetworkManager: MockNetworkManager!
    var networkService: NetworkService!
    
    override func setUp() {
        super.setUp()
        print("calling 1")
        mockNetworkManager = MockNetworkManager()
        networkService = NetworkService(networkManget: mockNetworkManager)
        }
    
    override func tearDown() {
        
        print("calling 4")
        mockNetworkManager = nil
        networkService = nil
        super.tearDown()
        
    }
    
    func testuserdata_success() async throws {
        print("calling 2")
        // given
        let userData = [UserEntity(id: 1, name: "vijay", email: "vijay@gmail.com", phone: "6666666666")]
        mockNetworkManager.mockData = try JSONEncoder().encode(userData)
        
        // when
        let user = try await networkService.fetchUserData()
        
        // than
        XCTAssertEqual(user.count, 1)
        XCTAssertEqual(user.first?.name, "vijay")
        
    }
    
    func testuserData_failuer() async throws {
        print("calling 3")
        // when
        mockNetworkManager.shouldFail = true
        do{
            // than
           _ = try await networkService.fetchUserData()
            XCTFail("Expected error but got success")
        } catch {
            XCTAssertTrue(error is CustomError)
        }
        
    }
    
}
