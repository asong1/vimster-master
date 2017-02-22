//
//  NetworkService.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

class NetworkService {
    
    private var task: URLSessionDataTask?
    private var successCodes: CountableRange<Int> = 200..<299
    private var failureCodes: CountableRange<Int> = 400..<499
    
    enum Method: String {
        case get, post, update, delete
    }
    
    typealias Parameters = [String: Any]
    
    func makeRequest(for url: URL,
                     method: Method,
                     params: Parameters?,
                     headers: [String: String]?,
                     success: ((Data?, HTTPURLResponse) -> Void)? = nil,
                     failure: ((_ data: Data?, _ error: Error?, _ responseCode: Int) -> Void)? = nil) {
        
        let session = URLSession.shared
        var mutableRequest = makeQuery(for: url, params: params)
        
        mutableRequest.allHTTPHeaderFields = headers
        mutableRequest.httpMethod = method.rawValue
        
        task = session.dataTask(with: mutableRequest, completionHandler: { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                failure?(data, error, 0)
                return
            }
            
            if let error = error {
                // Request failed, might be internet connection issue
                failure?(data, error, httpResponse.statusCode)
                return
            }
            
            if self.successCodes.contains(httpResponse.statusCode) {
                success?(data, httpResponse)
            } else if self.failureCodes.contains(httpResponse.statusCode) {
                switch httpResponse.statusCode {
                default:
                    failure?(data, error, httpResponse.statusCode)
                }
            } else {
                // Server returned response with status code different than
                // expected `successCodes`.
                let info = [
                    NSLocalizedDescriptionKey: "Request failed with code \(httpResponse.statusCode)",
                    NSLocalizedFailureReasonErrorKey: "Wrong handling logic, wrong endpoing mapping or backend bug."
                ]
                let error = NSError(domain: "NetworkService", code: 0, userInfo: info)
                failure?(data, error, httpResponse.statusCode)
            }
        })
        task?.resume()
    }
    
    func makeQuery(for url: URL, params: Parameters?) -> URLRequest {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let query = convert(params: params)
        components?.query = query
        return URLRequest(url: components!.url!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
    }
    
    fileprivate func convert(params: Parameters?) -> String {
        var query = ""
        
        params?.forEach { key, value in
            let valueString = "\(value)"
            query = query + "\(key)=\(valueString)&"
        }
        
        return query
    }
    
    func cancel() {
        task?.cancel()
    }

}
