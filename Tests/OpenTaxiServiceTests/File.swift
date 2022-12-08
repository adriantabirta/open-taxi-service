//
//  File.swift
//  
//
//  Created by Adrian Tabirta on 05.12.2022.
//

import XCTest
import GRPC
import SwiftProtobuf
@testable import OpenTaxiService

final class ClientForLibTests: XCTestCase {
    
    func testSome() {
        let service = AuthenticationServiceTestClient()
        
        service.enqueueauthenticateResponse(Google_Protobuf_StringValue.init("some"))
        service.authenticate(AuthenticationRequest()).response.always { result in
            if case let .success(value) = result {
                XCTAssertEqual(value.value, "some")
                XCTAssertFalse(service.hassendAuthenticationCodeResponsesRemaining)
                return
            }
            
            XCTFail("some")
        }
    }
}
