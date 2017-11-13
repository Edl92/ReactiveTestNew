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
    
//        var i = 0
//        
//        sg = SignalProducer<String,NoError>{(sink, disposable) -> () in
//           sink.send(value: "Hello World")
//           sink.sendCompleted()
//        
//        }.map({ (s: String) -> String in
//            return s.uppercased()
//        })
        
        
        //STUDIO map, flatMap, reduce, filer
        
        //Vettori per esempio
        let a = [2.0,3.0]
        let b = [3.0,5.0]
        let c = [5.0,6.0]
        let d = [2.0,4.0,6.0,7.0,8.0,9.0,10.0]
        
        let e = [a,b,c,d]
        
        //Soluzione 1
        let sum = e.flatMap{$0}.reduce(0,+) // più veloce
        
        let flatE = e.flatMap{$0}
        
        //Soluzione 32
        let sum2 = e.map{ $0.reduce(0,+) }
        let test = sum2.reduce(0, +)
        
        let flatSum = flatE.reduce(0, +)
        
        
        print("ArrayCollection:\n\(e)")
        print("FlatArray:\n\(flatE)")
        print("Sum Soluzione 1:\n\(sum)")
        print("Sum1 Soluzione 2:\n\(sum2)")
        print("SumTotale Soluzione 2:\n\(test)")
        print("Sum FlatArray:\n\(flatSum)")
        
        if (a[0] .truncatingRemainder(dividingBy: 2) == 0){
            print("Sto cazzo")
        }
        
        let pari = flatE.filter{ $0 .truncatingRemainder(dividingBy: 2)   == 0}
        
        print(pari)
        
       /* clock = Signal<Date,NoError>{ (sink)->Disposable? in
            
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
 
        
        
        var disposable: Disposable?
        disposable = clock?.observeValues { (d: Date) in
            print("Received value \(d)")
            
            if i == 10 {
                disposable!.dispose()
            }
        }
        
        let sp = SignalProducer<Date, NoError> { sink, disposable in
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer: Timer) in
                print("tick")
                sink.send(value: Date())
            })
        }
        */

        
        
//        let sp = SignalProducer<Date, NoError> { sink, disposable in
//            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer: Timer) in
//                // check if the disposable has been disposed
//                if disposable.hasEnded {
//                    timer.invalidate()
//                }
//                print("tick")
//                sink.send(value: Date())
//            })
//        }
//        
//        sp.startWithValues { (d) in
//            print(d)
//        }
//        
//        var disposable: Disposable?
//        disposable = sp.startWithValues { (time: Date) in
//            print("time: \(time)")
//            i += 1
//            if i == 10 {
//                disposable!.dispose()
//            }
//        }
        
        
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

