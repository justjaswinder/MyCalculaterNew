//
//  ViewController.swift
//  MyCalculator
//
//  Created by MacStudent on 2019-10-29.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   // @IBOutlet weak var lablelView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var prevNum = 0.0
    var lastOp = ""
    var added = ""
    var result = 0.0
    var lastResult = 0.0
    var isLastOperator = false
    var isMinus = true
    
    
    //var arrNum : [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    lablelView.layer.cornerRadius = 14.0
     
        // Do any additional setup after loading the view.
    }
 
    
    //All Button clicks
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            print("1")
            setLabelTxt(num: 1)
            
        case 2:
            print("2")
            setLabelTxt(num: 2)
        case 3:
            print("3")
            setLabelTxt(num: 3)
            
        case 4:
            print("4")
            setLabelTxt(num: 4)
        case 5:
            print("5")
            setLabelTxt(num: 5)
        case 6:
            print("6")
            setLabelTxt(num: 6)
        case 7:
            print("7")
            setLabelTxt(num: 7)
        case 8:
            print("8")
            setLabelTxt(num: 8)
        case 9:
            print("9")
            setLabelTxt(num: 9)
        case 0:
            print("0")
            setLabelTxt(num: 0)
            
        case 22:
            
            setMinPlus()
            
        case 33:
            lastOp = "%"
            if(!isLastOperator){
                
                if(added == ""){
                    added = String(lastResult)
                }
                prevNum = Double(added)!
                added = ""
                isLastOperator = true
            }
            added = ""
            
        case 44:
            
            lastOp = "/"
            if(!isLastOperator){
                if(added == ""){
                    added = String(lastResult)
                }
                prevNum = Double(added)!
                added = ""
                isLastOperator = true
            }
            added = ""
        case 55:
            
            lastOp = "*"
            if(!isLastOperator){
                if(added == ""){
                    added = String(lastResult)
                }
                prevNum = Double(added)!
                added = ""
                isLastOperator = true
            }
            added = ""
        case 66:
            
            lastOp = "-"
            if(!isLastOperator){
                if(added == ""){
                    added = String(lastResult)
                }
                prevNum = Double(added)!
                added = ""
                isLastOperator = true
            }
            added = ""
        case 77:
            
            lastOp = "+"
            if(!isLastOperator){
                if(added == ""){
                    added = String(lastResult)
                }
                prevNum = Double(added)!
                added = ""
                isLastOperator = true
            }
            added = ""
        case 88:
            print("result")
            calculate()
            
        case 99:
            added = added + "."
            resultLabel.text = added
            
        case 11:
            clearLabelTxt()
            
            
        default:
            print("NOOO")
        }
    }
    
    func clearLabelTxt(){
        resultLabel.text = "0"
        added = ""
        lastResult = 0.0
    }
    
    
    func setLabelTxt(num : Double) {
        
        if num.rounded(.up) == num.rounded(.down){
            
            added = added + String(Int(num))
            resultLabel.text = added
        }else{
            added = added + String(num)
            resultLabel.text = added
            
        }
        
    }
    
    func setMinPlus() {
        
        //  let temp = added
        print("1st \(isMinus)")
        if(isMinus) {
            
            isMinus = false
            print("2nd \(isMinus)")
            print("2nd add\(added)")
            print("2nd lst\(lastResult)")
            if(added != ""){
                
                if( added.contains("-")) {
                    added =  String(added)
                    
                }
                    
                else {
                    added = "-" + String(added)
                    
                }}
            
            if(added == "" && lastResult == 0.0){
                
                
                if( added.contains("-")){
                    added =  String(added)
                    
                }
                else{
                    added = "-" + String(added)
                    
                }
            }
            
            
            
            if(added == "" && lastResult != 0.0) {
                if lastResult.rounded(.up) == lastResult.rounded(.down) {
                    
                    let val = Int(lastResult)
                    if( String(val).contains("-")){
                        added = String(val)
                        
                    }
                    else{
                        added = "-" + String(val)
                        
                    }
                    
                } else {
                    if( String(lastResult).contains("-")) {
                        added = String(lastResult)
                        
                    }
                    else{
                        added = "-" + String(lastResult)
                    }
                }
                
            }
            
            
        } else {
            isMinus = true
            print("3rd \(isMinus)")
            var chars: [Character] = []
            //  resultLabel.text = temp
            
            if(added != ""){
                chars = Array(added)
                
                if(!(chars.count == 0)){
                    if(chars[0] == "-"){
                        
                        chars.remove(at: 0)
                    }
                }
                added = String(chars)
            }
            
            
            if(added == "" && lastResult != 0.0) {
                
                if lastResult.rounded(.up) == lastResult.rounded(.down) {
                    
                    let valu = Int(lastResult)
                    chars = Array(String(valu))
                    
                    if(!(chars.count == 0)){
                        if(chars[0] == "-"){
                            
                            chars.remove(at: 0)
                        }
                    }
                }
                else{
                    chars = Array(String(lastResult))
                    
                    if(!(chars.count == 0)){
                        if(chars[0] == "-"){
                            
                            chars.remove(at: 0)
                        }
                    }
                }
                
                
                added = String(chars)
            }
            
            
            
        }
        
        
        resultLabel.text = added
        
    }
    
    
    func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
        
        var chars = Array(myString)
        if(chars.count == 0){
            return ""
        }
        
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
    
    
    func calculate(){
        print("4st \(isMinus)")
        if(isMinus == false) {
            print("5th \(isMinus)")
            prevNum *= -1
            if(added == ""){
                return
            }
            if (lastOp == "+"){
                print("5th num  \(prevNum)")
                result = Double(prevNum * -1) + Double(added)!
                print("5th result \(result)")
            }
            if (lastOp == "-"){
                result = Double(prevNum * -1) - Double(added)!
            }
            if (lastOp == "*"){
                result = Double(prevNum * -1) * Double(added)!
            }
            if (lastOp == "/"){
                result = Double(prevNum * -1) / Double(added)!
            }
            if (lastOp == "%"){
                let res = Int(prevNum * -1) % Int(added)!
                result = Double(res)
            }
        }
        else{
            print("6th \(isMinus)")
            //            isMinus = false
            if(added == ""){
                return
            }
            if (lastOp == "+"){
                result = Double(prevNum) + Double(added)!
            }
            if (lastOp == "-"){
                result = Double(prevNum) - Double(added)!
            }
            if (lastOp == "*"){
                result = Double(prevNum) * Double(added)!
            }
            if (lastOp == "/"){
                result = Double(prevNum) / Double(added)!
            }
            if (lastOp == "%"){
                let res = Int(prevNum) % Int(added)!
                result = Double(res)
            }
            
        }
        added = ""
        if result < 2147489646 && result.rounded(.up) == result.rounded(.down){
            
            
            let result1 = Int(result)
            resultLabel.text = String(result1)
            result = Double(result1)
            
        }else{
            
            resultLabel.text = String(format:"%.2f", result)
            
        }
        prevNum = result
        
        lastResult = result
        
        added = ""
        isLastOperator = false
    }
}

