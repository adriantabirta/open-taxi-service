//
//  AuthenticationRemoteDataSource.swift
//  
//
//  Created by Adrian Tabirta on 03.12.2022.
//

import Combine
import CombineGRPC

public protocol AuthenticationRemoteDataSource {
    
    func sendAuthenticationCode(_ phoneNumber: String) -> AnyPublisher<Void, RPCError>
    
    func authenticate(_ authenticationRequest: AuthenticationRequest) -> AnyPublisher<String, RPCError>
}
