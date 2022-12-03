//
//  RideRemoteDataSource.swift
//  
//
//  Created by Adrian Tabirta on 03.12.2022.
//

import Combine
import CombineGRPC

public protocol RideRemoteDataSource {
    
    func placeOrder(_ rideRequest: RideRequest) -> AnyPublisher<RideResponse, RPCError>
    
    func sendChatMessage(_ message: String) -> AnyPublisher<Void, RPCError>

    func cancelRide(_ message: String) -> AnyPublisher<Void, RPCError>
}
