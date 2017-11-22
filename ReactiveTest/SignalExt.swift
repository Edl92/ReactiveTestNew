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

    var sg : SignalProducer<String, NoError>?
    var clock : Signal<Date, NoError>?
    var i = 0
    
        override init(){
            super .init()
    
            sg = SignalProducer<String,NoError>{(sink, disposable) -> () in
                sink.send(value: "Hello World")
                sink.sendCompleted()
                
                }.map({ (s: String) -> String in
                    return s.uppercased()
                })
            
            clock = Signal<Date,NoError>{ (sink)->Disposable? in
                
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (t) in
                    //   print("tick\(i)")
                    self.i += 1
                    sink.send(value: Date())
                })
                
                return AnyDisposable()
            }
    
        }
            
    
    
    func doTest(){
    
        var disposable: Disposable?
        
        clock?.observeValues { (d: Date) in
            print("Received tick at \(d)")
        }
        
        
        
        
        disposable = clock?.observeValues { (d: Date) in
            print("Received value \(d)")
            
            if self.i == 10 {
                disposable!.dispose()
            }
        }
        
        
        let sp2 = SignalProducer<Date, NoError> { sink, disposable in
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer: Timer) in
                // check if the disposable has been disposed
                if disposable.hasEnded {
                    timer.invalidate()
                }
                print("tick")
                sink.send(value: Date())
            })
        }
        
        sp2.startWithValues { (d) in
            print(d)
        }
        
        disposable = sp2.startWithValues { (time: Date) in
            print("time: \(time)")
            self.i += 1
            if self.i == 10 {
                disposable!.dispose()
            }
        }
        
        
    }

}
