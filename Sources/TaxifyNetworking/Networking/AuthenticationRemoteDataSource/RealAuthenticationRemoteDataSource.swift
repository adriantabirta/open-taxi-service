//
//  RealAuthenticationRemoteDataSource.swift
//  
//
//  Created by Adrian Tabirta on 03.12.2022.
//

import Combine
import Resolver
import CombineGRPC

struct RealAuthenticationRemoteDataSource {
    
    // MARK: - Dependencies
    
    @Injected private var grpcExecutor: GRPCExecutor
    
    @Injected private var authenticationServiceNIOClient: AuthenticationServiceNIOClient
}

extension RealAuthenticationRemoteDataSource: AuthenticationRemoteDataSource {
  
    func sendAuthenticationCode(_ phoneNumber: String) -> AnyPublisher<Void, RPCError> {
        grpcExecutor.call(authenticationServiceNIOClient.sendAuthenticationCode)(.init(phoneNumber))
            .map { _ in Void() }
            .eraseToAnyPublisher()
    }
    
    func authenticate(_ authenticationRequest: AuthenticationRequest) -> AnyPublisher<String, RPCError> {
        grpcExecutor.call(authenticationServiceNIOClient.authenticate)(authenticationRequest)
            .map { $0.value }
            .eraseToAnyPublisher()
    }
}
