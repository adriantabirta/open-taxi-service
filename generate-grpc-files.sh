#!/bin/sh

protoc --proto_path=ProtoFiles ProtoFiles/*.proto \
--swift_out=Visibility=public,FileNaming=DropPath:Sources/TaxifyNetworking/GeneratedFiles \
--grpc-swift_opt=Visibility=Public,FileNaming=DropPath,Client=true,Server=false \
--grpc-swift_out=Sources/TaxifyNetworking/GeneratedFiles
