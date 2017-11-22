//
//  ViewController.swift
//  ReactiveTest
//
//  Created by Wind3 on 09/11/2017.
//  Copyright © 2017 Wind3. All rights reserved.
//

import UIKit
import Foundation
import ReactiveCocoa
import ReactiveSwift
import Result

class ViewController: UIViewController {

    @IBOutlet weak var label:UILabel?
    @IBOutlet weak var button:UIButton?
    var sg : SignalProducer<String, NoError>?
    var clock : Signal<Date, NoError>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var i = 0
        var disposable: Disposable?
        
        sg = SignalProducer<String,NoError>{(sink, disposable) -> () in
           sink.send(value: "Hello World")
           sink.sendCompleted()
        
        }.map({ (s: String) -> String in
            return s.uppercased()
        })
        

        clock = Signal<Date,NoError>{ (sink)->Disposable? in
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (t) in
             //   print("tick\(i)")
                i += 1
                sink.send(value: Date())
            })
        
            return AnyDisposable()
        }
        
        clock?.observeValues { (d: Date) in
            print("Received tick at \(d)")
        }
 
        
        

        disposable = clock?.observeValues { (d: Date) in
            print("Received value \(d)")
            
            if i == 10 {
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
            i += 1
            if i == 10 {
                disposable!.dispose()
            }
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func didPressButton(sender:UIButton){
        

        sg?.startWithValues({ (input : String) in
            self.label?.text = input
        })
        
    }
    

}

