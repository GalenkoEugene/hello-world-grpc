# grpc example

### Build API using gRPC and protobufs

```bash
grpc_tools_ruby_protoc --ruby_out=lib --grpc_out=lib helloworld.proto
```


### Run server

```bash
ruby greeter_server.rb
```

### Run client

```bash
ruby greeter_client.rb Yevhenii
```
