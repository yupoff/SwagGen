//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TBX.Auth {

    public enum AuthReturnLogin {

      public static let service = APIService<Response>(id: "auth.returnLogin", tag: "auth", method: "GET", path: "/auth/{cp}/returnLogin", hasBody: false)

      public final class Request: APIRequest<Response> {

          public struct Options {

              public var cp: String

              public var idp: String

              public var token: String?

              public init(cp: String, idp: String, token: String? = nil) {
                  self.cp = cp
                  self.idp = idp
                  self.token = token
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: AuthReturnLogin.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(cp: String, idp: String, token: String? = nil) {
              let options = Options(cp: cp, idp: idp, token: token)
              self.init(options: options)
          }

          public override var path: String {
              return super.path.replacingOccurrences(of: "{" + "cp" + "}", with: "\(self.options.cp)")
          }

          public override var parameters: [String: Any] {
              var params: JSONDictionary = [:]
              params["idp"] = options.idp
              if let token = options.token {
                params["token"] = token
              }
              return params
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Auth

            /** Request was successful */
            case status200(Auth)

            public var success: Auth? {
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
