//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.StopPoint {

    public enum StopPointRoute {

      public static let service = APIService<Response>(id: "StopPoint_Route", tag: "StopPoint", method: "GET", path: "/StopPoint/{id}/Route", hasBody: false)

      /** A comma-separated list of service types to filter on. If not specified. Supported values: Regular, Night. Defaulted to 'Regular' if not specified */
      public enum ServiceTypes: String {
          case regular = "Regular"
          case night = "Night"

          public static let cases: [ServiceTypes] = [
            .regular,
            .night,
          ]
      }

      public final class Request: APIRequest<Response> {

          public struct Options {

              /** A stop point id (station naptan codes e.g. 940GZZLUASL, you can use /StopPoint/Search/{query} endpoint to find a stop point id from a station name) */
              public var id: String

              /** A comma-separated list of service types to filter on. If not specified. Supported values: Regular, Night. Defaulted to 'Regular' if not specified */
              public var serviceTypes: [ServiceTypes]?

              public init(id: String, serviceTypes: [ServiceTypes]? = nil) {
                  self.id = id
                  self.serviceTypes = serviceTypes
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: StopPointRoute.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(id: String, serviceTypes: [ServiceTypes]? = nil) {
              let options = Options(id: id, serviceTypes: serviceTypes)
              self.init(options: options)
          }

          public override var path: String {
              return super.path.replacingOccurrences(of: "{" + "id" + "}", with: "\(self.options.id)")
          }

          public override var parameters: [String: Any] {
              var params: JSONDictionary = [:]
              if let serviceTypes = options.serviceTypes?.encode().map({ String(describing: $0) }).joined(separator: ",") {
                params["serviceTypes"] = serviceTypes
              }
              return params
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [StopPointRouteSection]

            /** OK */
            case status200([StopPointRouteSection])

            public var success: [StopPointRouteSection]? {
                switch self {
                case .status200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                }
            }

            public var statusCode: Int {
              switch self {
              case .status200: return 200
              }
            }

            public var successful: Bool {
              switch self {
              case .status200: return true
              }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 200: self = try .status200(JSONDecoder.decode(data: data))
                default: throw APIError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
