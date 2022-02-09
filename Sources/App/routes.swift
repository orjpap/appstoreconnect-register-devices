import Vapor
import AppStoreConnect_Swift_SDK

let configuration = APIConfiguration(issuerID: "",
                                     privateKeyID: "",
                                     privateKey: "")


func routes(_ app: Application) throws {
    app.get { req in
        return req.view.render("main")
    }

    app.post("registerDevice") { req -> EventLoopFuture<String> in
        struct DeviceInfo: Content {
            private var name: String
            private var deviceModel: String
            private var other: String
            var platform: Platform
            var udid: String

            var registrationName: String {
                return "\(name) \(deviceModel) \(other)"
            }
        }
        let input = try req.content.decode(DeviceInfo.self)

        let provider: APIProvider = APIProvider(configuration: configuration)
        // Create a new promise for some string.
        let promiseString = req.eventLoop.makePromise(of: String.self)

        provider.request(.registerNewDevice(name: input.registrationName,
                                            platform: input.platform,
                                            udid: input.udid)) { (result) in
            switch result {
            case .success:
                promiseString.completeWith(.success("Did register device with info: \(String(describing: input))"))
            case .failure(let error):
                promiseString.completeWith(.success("Something went wrong while adding the device: \(error)"))
            }
        }

        return promiseString.futureResult
    }
}
