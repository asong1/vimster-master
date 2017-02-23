//
//  VimeoVideoOperation.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

final class VimeoVideoOperation: ServiceOperation {

    public var success: (([Video]) -> Void)?
    public var failure: ((Error) -> Void)?
    var category: String
    
    init(category: String) {
        self.category = category
    }

    public override func start() {
        super.start()
        let request = VimeoVideoRequest()
        request.category = self.category
        service.request(request, success: handleSuccess, failure: handleFailure)
    }

    private func handleSuccess(_ response: Any?) {
        do {
            if let response = response as? [String: Any] {
                let items = try ArrayResponseMapper.process(response["data"], mapper: {
                    json in
                    try VideoResponseMapper.process(json)
                })
                self.success?(items)
                self.finish()
            }
        } catch {
            handleFailure(NSError.cannotParseResponse())
        }
    }
    
    private func handleFailure(_ error: Error) {
        self.failure?(error)
        self.finish()
    }

}
