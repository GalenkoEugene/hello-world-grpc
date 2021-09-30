#!/usr/bin/env ruby

# Sample gRPC server that implements the Greeter::Helloworld service.

this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'helloworld_services_pb'
require_relative 'jokes/client'

class GreeterServer < Helloworld::Greeter::Service
  def say_hello(hello_req, _callback)
    Helloworld::HelloReply.new(message: "Hello #{hello_req.name}")
  end

  def say_hello_again(hello_req, _callback)
    Helloworld::HelloReply.new(message: "Hello again, #{hello_req.name}")
  end

  def get_joke_by_id(hello_req, _callback)
    p hello_req
    Helloworld::JokeBody.new(joke: Cleint.get_joke(hello_req.id))
  end
end

# main starts an RpcServer that receives requests to GreeterServer at the sample
# server port.
def main
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
  s.handle(GreeterServer)
  # Runs the server with SIGHUP, SIGINT and SIGQUIT signal handlers to
  #   gracefully shutdown.
  # User could also choose to run server via call to run_till_terminated
  s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
end

main
