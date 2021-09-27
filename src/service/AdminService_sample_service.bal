import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:ServiceDescriptor {descriptor: ROOT_DESCRIPTOR, descMap: getDescriptorMap()}
service "AdminService" on ep {

    remote function add(AddRequest value) returns AddResponse|error {
    }
    remote function delete(DeleteRequest value) returns DeleteResponse|error {
    }
    remote function show(ShowRequest value) returns ShowResponse|error {
    }
}

