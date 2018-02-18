//
//  ViewController.swift
//  Money
//
//  Created by Maho Misumi on 2018/02/09.
//  Copyright © 2018年 Maho Misumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var syunyuTextfield: UITextField!
    @IBOutlet var syunyunaiyoTextfield: UITextField!
    @IBOutlet var shishutuTextfield: UITextField!
    @IBOutlet var shishutunaiyoTextfield: UITextField!
    @IBOutlet var zandakaLabel: UILabel!
    @IBOutlet var syunyurirekiLabel: UILabel!
    @IBOutlet var shishuturirekiLabel: UILabel!
    
    var number: Int! = 0
    var text1: String! = "0"
    var text2: String! = "0"
    var naiyo1: String! = ""
    var naiyo2: String! = ""
    
    var shunyurirekiarray: [String] = []
    var shishuturirekiarray = [String]()
    
    let saveData: UserDefaults = UserDefaults.standard


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        syunyuTextfield.delegate = self
        syunyunaiyoTextfield.delegate = self
        shishutuTextfield.delegate = self
        shishutunaiyoTextfield.delegate = self
        
        //履歴取り出し
        shunyurirekiarray = saveData.array(forKey: "shunyunaiyo") as? [String] ?? []
        shishuturirekiarray = saveData.array(forKey: "shishutunaiyo") as? [String] ?? []
        
        //shunyurirekiLabelに表示
        var i = 0
        for shunyurireki in shunyurirekiarray {

            if i % 2 == 0 {
                syunyurirekiLabel.text = syunyurirekiLabel.text! + shunyurireki + " "
                print(shunyurireki)
                print(shunyurirekiarray)
            } else {
                syunyurirekiLabel.text = syunyurirekiLabel.text! + shunyurireki + "\n"
            }
            i = i + 1
        }

       
        for shishuturireki in shunyurirekiarray {
            
            if i % 2 == 0{
                shishuturirekiLabel.text = shishuturirekiLabel.text! + shishuturireki + ""
                } else {
                shishuturirekiLabel.text = shishuturirekiLabel.text! + shishuturireki + "\n"
            }
            i = i + 1
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shunyu(){
        saveData.set(syunyuTextfield.text, forKey: "shunyu")
//        syunyuTextfield.text = saveData.object(forKey:"shunyu") as? String
        
        
        

        number = number + Int(text1)!
        zandakaLabel.text = String(number)
        
        print(number)
        shunyurirekiarray.append(naiyo1)
        shunyurirekiarray.append(text1)
        
        if syunyuTextfield.text! == Empty {
            syunyuTextfield.text! = ""
        } else{
            text1 = syunyuTextfield.text!
        }
        
        if syunyunaiyoTextfield.text! == is.Empty {
           syunyunaiyoTextfield.text! = ""
        } else{
            naiyo1 = syunyunaiyoTextfield.text!
        }
        
        }
        
        saveData.set(shunyurirekiarray, forKey: "shunyunaiyo")
//        syunyuTextfield.text = saveData.object(forKey:"shunyunaiyo") as? String
//        syunyunaiyoTextfield.text = saveData.object(forKey:"shunyu") as? String
        
        syunyurirekiLabel.text = String(describing: shunyurirekiarray)
        
        //履歴取り出し
        shunyurirekiarray = saveData.array(forKey: "shunyunaiyo") as? [String] ?? []
        
    }
    
    @IBAction func shishutu(){
        saveData.set(shishutuTextfield.text, forKey: "shishutu")
        shishutuTextfield.text = saveData.object(forKey:"shishutu") as? String
        
        text2 = shishutuTextfield.text!
        
        number = number - (Int(text2))!
        zandakaLabel.text = String(number)
    
}
    
    
    @IBAction func reset(){
        number = 0
        text1 = "0"
        naiyo1 = "0"
        syunyuTextfield.text = ""
        shishutuTextfield.text = ""
        syunyunaiyoTextfield.text = ""
        shishutunaiyoTextfield.text = ""
        zandakaLabel.text = ""
        syunyurirekiLabel.text = ""
        shishuturirekiLabel.text = ""
        shunyurirekiarray.removeAll()
        shishuturirekiarray.removeAll()
        
    }
}

