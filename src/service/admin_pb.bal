import ballerina/grpc;

public isolated client class AdminServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, ROOT_DESCRIPTOR, getDescriptorMap());
    }

    isolated remote function add(AddRequest|ContextAddRequest req) returns (AddResponse|grpc:Error) {
        map<string|string[]> headers = {};
        AddRequest message;
        if (req is ContextAddRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_package.AdminService/add", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <AddResponse>result;
    }

    isolated remote function addContext(AddRequest|ContextAddRequest req) returns (ContextAddResponse|grpc:Error) {
        map<string|string[]> headers = {};
        AddRequest message;
        if (req is ContextAddRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_package.AdminService/add", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <AddResponse>result, headers: respHeaders};
    }

    isolated remote function delete(DeleteRequest|ContextDeleteRequest req) returns (DeleteResponse|grpc:Error) {
        map<string|string[]> headers = {};
        DeleteRequest message;
        if (req is ContextDeleteRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_package.AdminService/delete", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <DeleteResponse>result;
    }

    isolated remote function deleteContext(DeleteRequest|ContextDeleteRequest req) returns (ContextDeleteResponse|grpc:Error) {
        map<string|string[]> headers = {};
        DeleteRequest message;
        if (req is ContextDeleteRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_package.AdminService/delete", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <DeleteResponse>result, headers: respHeaders};
    }

    isolated remote function show(ShowRequest|ContextShowRequest req) returns (ShowResponse|grpc:Error) {
        map<string|string[]> headers = {};
        ShowRequest message;
        if (req is ContextShowRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_package.AdminService/show", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ShowResponse>result;
    }

    isolated remote function showContext(ShowRequest|ContextShowRequest req) returns (ContextShowResponse|grpc:Error) {
        map<string|string[]> headers = {};
        ShowRequest message;
        if (req is ContextShowRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_package.AdminService/show", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ShowResponse>result, headers: respHeaders};
    }
}

public client class AdminServiceShowResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendShowResponse(ShowResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextShowResponse(ContextShowResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class AdminServiceAddResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendAddResponse(AddResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextAddResponse(ContextAddResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class AdminServiceDeleteResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendDeleteResponse(DeleteResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextDeleteResponse(ContextDeleteResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextAddRequest record {|
    AddRequest content;
    map<string|string[]> headers;
|};

public type ContextDeleteResponse record {|
    DeleteResponse content;
    map<string|string[]> headers;
|};

public type ContextShowResponse record {|
    ShowResponse content;
    map<string|string[]> headers;
|};

public type ContextShowRequest record {|
    ShowRequest content;
    map<string|string[]> headers;
|};

public type ContextAddResponse record {|
    AddResponse content;
    map<string|string[]> headers;
|};

public type ContextDeleteRequest record {|
    DeleteRequest content;
    map<string|string[]> headers;
|};

public type AddRequest record {|
    string AddNewFunction = "";
    string AddFunction = "";
|};

public type DeleteResponse record {|
    string DeleteFunction = "";
|};

public type ShowResponse record {|
    string ShowFunction = "";
    string ShowAllFunctions = "";
    string ShowAllWithCriteria = "";
|};

public type CreateRequest record {|
    string firstname = "";
|};

public type ShowRequest record {|
    string ShowFunction = "";
    string ShowAllFunctions = "";
    string ShowAllWithCriteria = "";
|};

public type Users record {|
    string firstname = "";
    string lastname = "";
    string email = "";
    string 'function = "";
|};

public type AddResponse record {|
    string AddNewFunction = "";
    string AddFunction = "";
|};

public type DeleteRequest record {|
    string DeleteFunction = "";
|};

const string ROOT_DESCRIPTOR = "0A0B61646D696E2E70726F746F120C677270635F7061636B61676522730A055573657273121C0A0966697273746E616D65180120012809520966697273746E616D65121A0A086C6173746E616D6518022001280952086C6173746E616D6512140A05656D61696C1803200128095205656D61696C121A0A0866756E6374696F6E180420012809520866756E6374696F6E222D0A0D43726561746552657175657374121C0A0966697273746E616D65180120012809520966697273746E616D6522560A0A4164645265717565737412260A0E4164644E657746756E6374696F6E180120012809520E4164644E657746756E6374696F6E12200A0B41646446756E6374696F6E180220012809520B41646446756E6374696F6E22570A0B416464526573706F6E736512260A0E4164644E657746756E6374696F6E180120012809520E4164644E657746756E6374696F6E12200A0B41646446756E6374696F6E180220012809520B41646446756E6374696F6E22370A0D44656C6574655265717565737412260A0E44656C65746546756E6374696F6E180120012809520E44656C65746546756E6374696F6E22380A0E44656C657465526573706F6E736512260A0E44656C65746546756E6374696F6E180120012809520E44656C65746546756E6374696F6E228F010A0B53686F775265717565737412220A0C53686F7746756E6374696F6E180120012809520C53686F7746756E6374696F6E122A0A1053686F77416C6C46756E6374696F6E73180220012809521053686F77416C6C46756E6374696F6E7312300A1353686F77416C6C576974684372697465726961180320012809521353686F77416C6C5769746843726974657269612290010A0C53686F77526573706F6E736512220A0C53686F7746756E6374696F6E180120012809520C53686F7746756E6374696F6E122A0A1053686F77416C6C46756E6374696F6E73180220012809521053686F77416C6C46756E6374696F6E7312300A1353686F77416C6C576974684372697465726961180320012809521353686F77416C6C57697468437269746572696132CE010A0C41646D696E53657276696365123A0A0361646412182E677270635F7061636B6167652E416464526571756573741A192E677270635F7061636B6167652E416464526573706F6E736512430A0664656C657465121B2E677270635F7061636B6167652E44656C657465526571756573741A1C2E677270635F7061636B6167652E44656C657465526573706F6E7365123D0A0473686F7712192E677270635F7061636B6167652E53686F77526571756573741A1A2E677270635F7061636B6167652E53686F77526573706F6E7365620670726F746F33";

isolated function getDescriptorMap() returns map<string> {
    return {"admin.proto": "0A0B61646D696E2E70726F746F120C677270635F7061636B61676522730A055573657273121C0A0966697273746E616D65180120012809520966697273746E616D65121A0A086C6173746E616D6518022001280952086C6173746E616D6512140A05656D61696C1803200128095205656D61696C121A0A0866756E6374696F6E180420012809520866756E6374696F6E222D0A0D43726561746552657175657374121C0A0966697273746E616D65180120012809520966697273746E616D6522560A0A4164645265717565737412260A0E4164644E657746756E6374696F6E180120012809520E4164644E657746756E6374696F6E12200A0B41646446756E6374696F6E180220012809520B41646446756E6374696F6E22570A0B416464526573706F6E736512260A0E4164644E657746756E6374696F6E180120012809520E4164644E657746756E6374696F6E12200A0B41646446756E6374696F6E180220012809520B41646446756E6374696F6E22370A0D44656C6574655265717565737412260A0E44656C65746546756E6374696F6E180120012809520E44656C65746546756E6374696F6E22380A0E44656C657465526573706F6E736512260A0E44656C65746546756E6374696F6E180120012809520E44656C65746546756E6374696F6E228F010A0B53686F775265717565737412220A0C53686F7746756E6374696F6E180120012809520C53686F7746756E6374696F6E122A0A1053686F77416C6C46756E6374696F6E73180220012809521053686F77416C6C46756E6374696F6E7312300A1353686F77416C6C576974684372697465726961180320012809521353686F77416C6C5769746843726974657269612290010A0C53686F77526573706F6E736512220A0C53686F7746756E6374696F6E180120012809520C53686F7746756E6374696F6E122A0A1053686F77416C6C46756E6374696F6E73180220012809521053686F77416C6C46756E6374696F6E7312300A1353686F77416C6C576974684372697465726961180320012809521353686F77416C6C57697468437269746572696132CE010A0C41646D696E53657276696365123A0A0361646412182E677270635F7061636B6167652E416464526571756573741A192E677270635F7061636B6167652E416464526573706F6E736512430A0664656C657465121B2E677270635F7061636B6167652E44656C657465526571756573741A1C2E677270635F7061636B6167652E44656C657465526573706F6E7365123D0A0473686F7712192E677270635F7061636B6167652E53686F77526571756573741A1A2E677270635F7061636B6167652E53686F77526573706F6E7365620670726F746F33"};
}

