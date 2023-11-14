//
//  Observable.swift
//  MovieTrending
//
//  Created by Shuaiqing Luo on 11/14/23.
//

import Foundation

class Observable<T> {
    
    typealias ListenerHandler = (T) -> Void
    
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    private var listener: ListenerHandler?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping(ListenerHandler)) {
        listener(value)
        self.listener = listener
    }
}
