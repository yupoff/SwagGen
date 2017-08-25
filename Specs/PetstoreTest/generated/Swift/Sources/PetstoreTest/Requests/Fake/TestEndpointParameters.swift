//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension PetstoreTest.Fake {

    /** Fake endpoint for testing various parameters
假端點
偽のエンドポイント
가짜 엔드 포인트
 */
    public enum TestEndpointParameters {

      public static let service = APIService<Response>(id: "testEndpointParameters", tag: "fake", method: "POST", path: "/fake", hasBody: true, authorization: Authorization(type: "http_basic_test", scope: ""))

      public final class Request: APIRequest<Response> {

          public struct Options {

              /** None */
              public var integer: Int?

              /** None */
              public var int32: Int?

              /** None */
              public var int64: Int?

              /** None */
              public var number: Double

              /** None */
              public var float: Float?

              /** None */
              public var double: Double

              /** None */
              public var string: String?

              /** None */
              public var patternWithoutDelimiter: String

              /** None */
              public var byte: String

              /** None */
              public var binary: String?

              /** None */
              public var date: Date?

              /** None */
              public var dateTime: Date?

              /** None */
              public var password: String?

              /** None */
              public var callback: String?

              public init(integer: Int? = nil, int32: Int? = nil, int64: Int? = nil, number: Double, float: Float? = nil, double: Double, string: String? = nil, patternWithoutDelimiter: String, byte: String, binary: String? = nil, date: Date? = nil, dateTime: Date? = nil, password: String? = nil, callback: String? = nil) {
                  self.integer = integer
                  self.int32 = int32
                  self.int64 = int64
                  self.number = number
                  self.float = float
                  self.double = double
                  self.string = string
                  self.patternWithoutDelimiter = patternWithoutDelimiter
                  self.byte = byte
                  self.binary = binary
                  self.date = date
                  self.dateTime = dateTime
                  self.password = password
                  self.callback = callback
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: TestEndpointParameters.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(integer: Int? = nil, int32: Int? = nil, int64: Int? = nil, number: Double, float: Float? = nil, double: Double, string: String? = nil, patternWithoutDelimiter: String, byte: String, binary: String? = nil, date: Date? = nil, dateTime: Date? = nil, password: String? = nil, callback: String? = nil) {
              let options = Options(integer: integer, int32: int32, int64: int64, number: number, float: float, double: double, string: string, patternWithoutDelimiter: patternWithoutDelimiter, byte: byte, binary: binary, date: date, dateTime: dateTime, password: password, callback: callback)
              self.init(options: options)
          }

          public override var parameters: [String: Any] {
              var params: JSONDictionary = [:]
              if let integer = options.integer {
                params["integer"] = integer
              }
              if let int32 = options.int32 {
                params["int32"] = int32
              }
              if let int64 = options.int64 {
                params["int64"] = int64
              }
              params["number"] = options.number
              if let float = options.float {
                params["float"] = float
              }
              params["double"] = options.double
              if let string = options.string {
                params["string"] = string
              }
              params["pattern_without_delimiter"] = options.patternWithoutDelimiter
              params["byte"] = options.byte
              if let binary = options.binary {
                params["binary"] = binary
              }
              if let date = options.date?.encode() {
                params["date"] = date
              }
              if let dateTime = options.dateTime?.encode() {
                params["dateTime"] = dateTime
              }
              if let password = options.password {
                params["password"] = password
              }
              if let callback = options.callback {
                params["callback"] = callback
              }
              return params
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void

            /** Invalid username supplied */
            case status400

            /** User not found */
            case status404

            public var success: Void? {
                switch self {
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                default: return ()
                }
            }

            public var statusCode: Int {
              switch self {
              case .status400: return 400
              case .status404: return 404
              }
            }

            public var successful: Bool {
              switch self {
              case .status400: return false
              case .status404: return false
              }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 400: self = .status400
                case 404: self = .status404
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
