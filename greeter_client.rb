#!/usr/bin/env ruby

# Sample app that connects to a Greeter service.

this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'helloworld_services_pb'

def main
  stub = Helloworld::Greeter::Stub.new('localhost:50051', :this_channel_is_insecure)
  user = ARGV.size > 0 ?  ARGV[0] : 'world'
  message = stub.say_hello(Helloworld::HelloRequest.new(name: user)).message
  p "Greeting: #{message}"
  message = stub.say_hello_again(Helloworld::HelloRequest.new(name: user)).message
  p "Greeting: #{message}"

  # Client generate random number to get Chuck Norris joke with this id via server client
  random_number = rand(1..500)
  joke = stub.get_joke_by_id(Helloworld::JokeId.new(id: random_number)).joke
  p "Fresh joke: #{joke}"
end

main
