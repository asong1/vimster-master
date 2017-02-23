//
//  BackendService.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

final class BackendService {

    let conf: BackendConfiguration
    let service = NetworkService()
    
    init(_ config: BackendConfiguration) {
        self.conf = config
    }

    func request(_ request: BackendAPIRequest,
                 successWithDataAndHttpUrlResponse: ((Any?, HTTPURLResponse) -> Void)? = nil,
                 failure: ((Error) -> Void)? = nil) {
        
        let url = conf.baseUrl.appendingPathComponent(request.endpoint)
        let headers = request.headers
        
        service.makeRequest(for: url, method: request.method, params: request.parameters, headers: headers, success: { (data, httpResponse) in
            
            var json: Any? = nil
            if let data = data {
                json = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)
            }
            if let json = json {
                if JSONSerialization.isValidJSONObject(json) {
                    successWithDataAndHttpUrlResponse?(json, httpResponse)
                }
            }
            
        }) { (data, error, statusCode) in
            print("handle error: \(statusCode)")
        }
    }
    
    func request(_ request: BackendAPIRequest,
                 success: ((Any?) -> Void)? = nil,
                 failure: ((Error) -> Void)? = nil) {
        self.request(request, successWithDataAndHttpUrlResponse: { (data, httpUrlResponse) in
            success?(data)
        }) { (error) in
            failure?(error)
        }
    }
    
    func cancel() {
        service.cancel()
    }
}
