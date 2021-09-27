import ballerina/log;
import ballerinax/azure_functions;
import ballerina/grpc;

//This is client implementation for unary blocking scenario
public function main(string...args) {

    //Client end configuration
    newFuctionBlockingClient newFuctionBlockingEp = new("http://localhost:9090");

    //Add a new function

    log:printInfo("----------------------Add new function---------");
    function Info  functionReq= {id: "40001", name:"function", description: "add brand new or new version of exsting function"};
    var addResponse = newFuctionBlockingEp - > addFucntion(functionReq)

}

