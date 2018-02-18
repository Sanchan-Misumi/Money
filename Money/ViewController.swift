//
//  ViewController.swift
//  Money
//
//  Created by Maho Misumi on 2018/02/09.
//  Copyright © 2018年 Maho Misumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
   
    @IBOutlet var incomeTextfield: UITextField!
    @IBOutlet var spendingTextfield: UITextField!
    
    @IBOutlet var incomeNaiyoTextfield: UITextField!
    @IBOutlet var spendingNaiyoTextfield: UITextField!
  
    @IBOutlet var zandakaLabel: UILabel!
    @IBOutlet var incomeRirekiLabel: UILabel!
    @IBOutlet var spendingRirekiLabel: UILabel!
    
    var number: Int! = 0
    var number1: String! = "0"
    var number2: String! = "0"
    var naiyo1: String! = ""
    var naiyo2: String! = ""
    
    
    var incomeRirekiarray: [String] = []
    var spendingRirekiarray = [String]()
    
    let saveData: UserDefaults = UserDefaults.standard


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        incomeTextfield.delegate = self
        spendingTextfield.delegate = self
        incomeNaiyoTextfield.delegate = self
        spendingNaiyoTextfield.delegate = self
        
        //履歴取り出し
        incomeRirekiarray = saveData.array(forKey: "incomenaiyo") as? [String] ?? []
       
        
        //shunyurirekiLabelに表示
        var i = 0
        for incomeRireki in incomeRirekiarray {

            if i % 2 == 0 {
                incomeRirekiLabel.text = incomeRirekiLabel.text! + incomeRireki + " "
               
            } else {
                incomeRirekiLabel.text = incomeRirekiLabel.text! + incomeRireki + "\n"
            }
            i = i + 1
        }

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shunyu(){
        saveData.set(incomeTextfield.text, forKey: "incomenaiyo")
//        syunyuTextfield.text = saveData.object(forKey:"shunyu") as? String


        number = number + Int(number1)!
        zandakaLabel.text = String(number)
        
        if incomeTextfield.text! .isEmpty {
            incomeTextfield.text! = "0"
        } else{
          number1 = incomeTextfield.text!
        }
        
        if incomeNaiyoTextfield.text! .isEmpty {
           incomeNaiyoTextfield.text! = ""
        } else{
            naiyo1 = incomeNaiyoTextfield.text!
        }
        
        incomeRirekiarray.append(naiyo1)
        incomeRirekiarray.append(number1)
        
        saveData.set(incomeRirekiarray, forKey: "incomenaiyo")
//        syunyuTextfield.text = saveData.object(forKey:"shunyunaiyo") as? String
//        syunyunaiyoTextfield.text = saveData.object(forKey:"shunyu") as? String
        
        incomeRirekiLabel.text = String(describing: incomeRirekiarray)
        
        //履歴取り出し
        incomeRirekiarray = saveData.array(forKey: "incomenaiyo") as? [String] ?? []
        
    }
    
    
    @IBAction func reset(){
        number = 0
        number1 = "0"
        naiyo1 = "0"
        incomeTextfield.text = ""
        incomeNaiyoTextfield.text = ""
        zandakaLabel.text = ""
        incomeRirekiLabel.text = ""
        
        incomeRirekiarray.removeAll()
        saveData.set(incomeRirekiarray, forKey: "incomenaiyo")
    }
}



