//
//  NetworkOperation.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

public class NetworkOperation: Operation {
    
    // lets client know when operation is ready to execute
    private var _isReady: Bool
    public override var isReady: Bool {
        get { return _isReady }
        set { update(
            { self._isReady = newValue }, key: "isReady") }
    }
    // client is actively working on a certain task
    private var _isExecuting: Bool
    public override var isExecuting: Bool {
        get { return _isExecuting }
        set { update({ self._isExecuting = newValue }, key: "isExecuting") }
    }
    // lets client know when operation is finished
    private var _isFinished: Bool
    public override var isFinished: Bool {
        get { return _isFinished }
        set { update({ self._isFinished = newValue }, key: "isFinished") }
    }
    
    private var _isCancelled: Bool
    public override var isCancelled: Bool {
        get { return _isCancelled }
        set { update({ self._isCancelled = newValue }, key: "isCancelled") }
    }
    
    private func update(_ change: (Void) -> Void, key: String) {
        willChangeValue(forKey: key)
        change()
        didChangeValue(forKey: key)
    }
    
    override init() {
        _isReady = true
        _isExecuting = false
        _isFinished = false
        _isCancelled = false
        super.init()
        name = "Network Operation"
    }
    
    public override var isAsynchronous: Bool {
        return true
    }
    
    public override func start() {
        if self.isExecuting == false {
            self.isReady = false
            self.isExecuting = true
            self.isFinished = false
            self.isCancelled = false
        }
    }
    
    /// Used only by subclasses. Externally you should use `cancel`.
    func finish() {
        self.isExecuting = false
        self.isFinished = true
    }
    
    public override func cancel() {
        self.isExecuting = false
        self.isCancelled = true
    }
}
