//
//  SignalExt.swift
//  ReactiveTest
//
//  Created by Wind3 on 14/11/2017.
//  Copyright © 2017 Wind3. All rights reserved.
//

import Foundation
import Result
import ReactiveCocoa
import ReactiveSwift


class SignalExt : NSObject{

    var singal:SignalProducer<Date,NoError>?
    
    override init(){
        super .init()
        
        singal! = SignalProducer
    }
    


}
