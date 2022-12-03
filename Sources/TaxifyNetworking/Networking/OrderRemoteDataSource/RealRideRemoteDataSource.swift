//
//  RealRideRemoteDataSource.swift
//  
//
//  Created by Adrian Tabirta on 03.12.2022.
//

import NIO
import GRPC
import Combine
import Resolver
import SwiftProtobuf
import CombineGRPC

struct RealRideRemoteDataSource {
    
    // MARK: - Dependencies
    
    @Injected private var grpcExecutor: GRPCExecutor
    
    @Injected private var rideServiceNIOClient: RideServiceNIOClient
}

// MARK: - RideRemoteDataSource

extension RealRideRemoteDataSource: RideRemoteDataSource {
    
    func placeOrder(_ rideRequest: RideRequest) -> AnyPublisher<RideResponse, RPCError> {
        grpcExecutor.call(rideServiceNIOClient.placeOrder(_:callOptions:handler:))(rideRequest).eraseToAnyPublisher()
    }
    
    func sendChatMessage(_ message: String) -> AnyPublisher<Void, RPCError> {
        grpcExecutor.call(rideServiceNIOClient.sendChatMessage)(Google_Protobuf_StringValue(message))
            .map { _ in Void() }
            .eraseToAnyPublisher()
    }
    
    func cancelRide(_ message: String) -> AnyPublisher<Void, RPCError> {
        grpcExecutor.call(rideServiceNIOClient.cancelRide)(Google_Protobuf_StringValue(message))
            .map { _ in Void() }
            .eraseToAnyPublisher()
    }
}
