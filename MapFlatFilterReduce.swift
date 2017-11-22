//
//  MapFlatFilterReduce.swift
//  ReactiveTest
//
//  Created by Wind3 on 13/11/2017.
//  Copyright © 2017 Wind3. All rights reserved.
//

import Foundation

class MapFlatFilterReduce : NSObject{

    var arrayMaster:Array<Array<Double>>?
    
    let a = [2.0,3.0]
    let b = [3.0,5.0]
    let c = [5.0,6.0]
    let d = [2.0,4.0,6.0,7.0,8.0,9.0,10.0]
    
    
    func createArray()->Array<Array<Double>>{

        arrayMaster = Array()
        
        arrayMaster?.append(a)
        arrayMaster?.append(b)
        arrayMaster?.append(c)
        arrayMaster?.append(d)
        
        return arrayMaster!
    }
    
    
    func sumWithFlatMap(flatArray: Array<Array<Double>>) -> Double{
        let sum = flatArray.flatMap{$0}.reduce(0,+)
        return sum
    }
    
    

    func sumWithFlatArraySecondMethod(flatArray: Array<Array<Double>>)-> Double{
            let flatE = flatArray.flatMap{$0}
            let flatSum = flatE.reduce(0, +)
            return flatSum
    }
  
    func sumWithMap(flatArray: Array<Array<Double>>) -> Double{
        let sum2 = flatArray.map{ $0.reduce(0,+) }
        let test = sum2.reduce(0, +)
        return test
    
    }
    
    func filterEven(flatArray : Array<Double>) -> Array<Double>{
        let pari = flatArray.filter{ $0 .truncatingRemainder(dividingBy: 2)   == 0} // il modulo % non funziona con i Double!!
        return pari
    }
    
    func chainMethod(array : Array<Double>) -> Array<Double>{
        let evenSquares = array.map{$0 * $0}.filter{$0 .truncatingRemainder(dividingBy: 2) == 0}
        return evenSquares
    }



}
