//
//  Injector.swift
//  
//
//  Created by Adrian Tabirta on 03.12.2022.
//

import NIO
import GRPC
import Resolver
import CombineGRPC

public struct Injector {
        
    static func inject() {
        Resolver.register { GRPCExecutor() }
        
        let channel = ClientConnection
            .insecure(group: MultiThreadedEventLoopGroup(numberOfThreads: 1))
            .connect(host: serverAddress, port: serverPort)

        Resolver.register { RideServiceNIOClient(channel: channel) }
        Resolver.register { AuthenticationServiceNIOClient(channel: channel) }

    }
}
