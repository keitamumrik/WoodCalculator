//
//  ViewController.swift
//  WoodCalculator
//
//  Created by 松村敬太 on 2018/04/14.
//  Copyright © 2018年 KeitaMatsumura. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var kindOfWood: UILabel!
    
    @IBOutlet weak var length: UITextField! //長さ
    @IBOutlet weak var width: UITextField!  //幅
    @IBOutlet weak var height: UITextField! //厚さ
    @IBOutlet weak var weight: UILabel!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        length.placeholder = "1800"
        width.placeholder = "1000"
        height.placeholder = "65"
        length.clearButtonMode = .always
        width.clearButtonMode = .always
        height.clearButtonMode = .always
        length.returnKeyType = .done
        width.returnKeyType = .done
        height.returnKeyType = .done
        self.length.delegate = self
        self.width.delegate = self
        self.height.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func calculate(_ sender: Any) {
        var taiseki:Int
        //長さ、幅、厚さを取得
            //空欄はダメ
        //体積を求める
        taiseki = Int(length.text!)! * Int(width.text!)! * Int(height.text!)!

        //重さに表示
        weight.text = String(taiseki)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

