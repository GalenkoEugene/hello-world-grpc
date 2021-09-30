# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: helloworld.proto for package 'helloworld'

require 'grpc'
require 'helloworld_pb'

module Helloworld
  module Greeter
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'helloworld.Greeter'

      rpc :SayHello, ::Helloworld::HelloRequest, ::Helloworld::HelloReply
      rpc :SayHelloAgain, ::Helloworld::HelloRequest, ::Helloworld::HelloReply
      rpc :GetJokeById, ::Helloworld::JokeId, ::Helloworld::JokeBody
    end

    Stub = Service.rpc_stub_class
  end
end
