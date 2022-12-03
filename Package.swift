// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TaxifyNetworking",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "TaxifyNetworking", targets: ["TaxifyNetworking"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.10.0"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.6.0"),
        .package(url: "https://github.com/vyshane/grpc-swift-combine.git", from: "1.1.0"),
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.5.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TaxifyNetworking",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "CombineGRPC", package: "grpc-swift-combine"),
                .product(name: "Resolver", package: "Resolver"),
            ],
            exclude: [
                "grpc-swift-config.json",
                "swift-protobuf-config.json"
            ],
            plugins: [
                .plugin(name: "SwiftProtobufPlugin", package: "swift-protobuf"),
                .plugin(name: "GRPCSwiftPlugin", package: "grpc-swift"),
            ]
        ),
        .testTarget(
            name: "TaxifyNetworkingTests",
            dependencies: ["TaxifyNetworking"]),
    ]
)
