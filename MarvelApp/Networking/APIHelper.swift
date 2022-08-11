//
//  APIHelper.swift
//  MarvelApp
//
//  Created by Randy Efan Jayaputra on 11/08/22.
//

import Foundation
import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON
import SwifterSwift

class ErrorObject: NSObject {
    var errorCode: String?
    var message: String
    var errorHandlerType: ErrorHandlerType
    var otherInfo: Any?
    
    init(errorCode: String?, message: String, errorHandlerType: ErrorHandlerType, otherInfo: Any? = nil) {
        self.errorCode = errorCode
        self.message = message
        self.errorHandlerType = errorHandlerType
        self.otherInfo = otherInfo
    }
}

enum ErrorHandlerType {
    case doNothing
    case showSnackbarOnly
    case backToPreviousPage
    case backToProductHomePage
    case backToRootPage
}

protocol ApiInterfaceDelegate: AnyObject {
    func onSuccess(interface: ApiInterface?, object: Any)
    func onFailed(interface: ApiInterface?, errorCode: String?, message: String, errorHandlerType: ErrorHandlerType, otherInfo: Any?)
}

protocol ApiInterface: AnyObject {
    var method: HTTPMethod? { get set }
    var url: URLConvertible { get set }
    var headers: HTTPHeaders? { get set }
    var parameters: Parameters? { get set }
    var encoding: ParameterEncoding? { get set }
    
    func start()
    func success(_ value: JSON, _ statusCode: Int)
    func failed(_ value: JSON?, _ statusCode: Int)
    func createObject(_ value: Any, _ statusCode: Int)
}

// MARK: Error Code
enum ErrorCode: Int {
    case errNetworkLost = -1005
    case errHttpLoadFailed = -1003
    case errBackgroundFetch = 53
    case errTimeOut = 408
    case errInternalServer = 500
    case errUnavailableService = 503
}

class ApiHelper {
    
    static var manager = setupSessionManager()
    
    static func setupSessionManager(timeoutForRequest: Double = 300, timeoutForResource: Double = 300) -> SessionManager {
        let configuration = URLSessionConfiguration.default
        
        // Set Timeout
        configuration.timeoutIntervalForRequest = timeoutForRequest
        configuration.timeoutIntervalForResource = timeoutForResource
        
        return Alamofire.SessionManager(configuration: configuration)
    }
    
    
    static func apiRequest(api: ApiInterface, isUseDefaultHeader: Bool = true, isUseDefaultParams: Bool = true) {
        ApiHelper.manager
            .requestWithoutCache(api.url, method: api.method ?? .get, parameters: [:], encoding: api.encoding ?? URLEncoding.default, headers: api.headers ?? [:])?
            .validate(statusCode: 200..<600)
            .responseSwiftyJSON(completionHandler: { (response) in
                switch response.result {
                case .success(response.result.value):
                    // Valid JSON Response
                    guard let value = response.result.value else {
                        api.failed(nil, response.response?.statusCode ?? -1)
                        return
                    }
                    
                    // Valid Success Response
                    api.success(value, response.response?.statusCode ?? -1)
                case .failure(let error):
                    if response.response?.statusCode == ErrorCode.errInternalServer.rawValue || response.response?.statusCode == ErrorCode.errUnavailableService.rawValue {
                        api.failed(nil, response.response?.statusCode ?? -1)
                    } else if error._code == NSURLErrorTimedOut || response.response?.statusCode == ErrorCode.errTimeOut.rawValue {
                        api.failed(nil, response.response?.statusCode ?? -1)
                    } else if error._code == NSURLErrorCancelled {
                        api.failed(["network_error": NSURLErrorCancelled], response.response?.statusCode ?? -1)
                    } else if error._code == ErrorCode.errBackgroundFetch.rawValue || error._code == ErrorCode.errNetworkLost.rawValue || error._code == ErrorCode.errHttpLoadFailed.rawValue {
                        api.failed(["network_error": ErrorCode.errBackgroundFetch.rawValue], response.response?.statusCode ?? -1)
                    } else {
                        // Valid JSON Response
                        guard let value = response.result.value else {
                            api.failed(nil, response.response?.statusCode ?? -1)
                            return
                        }
                        
                        // Valid Failed Response
                        api.failed(value, response.response?.statusCode ?? -1)
                    }
                default:
                    break
                }
            })
    }
}


extension Alamofire.SessionManager {
    
    @discardableResult
    open func requestWithoutCache(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> DataRequest? {
            do {
                var urlRequest = try URLRequest(url: url, method: method, headers: headers)
                urlRequest.cachePolicy = .reloadIgnoringCacheData
                let encodedURLRequest = try encoding.encode(urlRequest, with: parameters)
                return request(encodedURLRequest)
            } catch {
                guard let url = "http://example.com/wrong_request".url else { return nil }
                return request(URLRequest(url: url))
            }
    }
    
}
