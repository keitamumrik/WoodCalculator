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
    
    var kindOfWoodNum = 0
    var dataListWoodName:[String] = ["杉","ヒノキ","楠","桜","楓"]
    var dataListSpecificGravity:[Double] = [0.9,0.8,0.7,0.6,0.5]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataListWoodName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataListWoodName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        kindOfWood.text = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0)
        kindOfWoodNum = pickerView.selectedRow(inComponent: 0)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("dataListの個数は \(dataListWoodName.count)")
        for dataListRow in dataListWoodName{
        print("dataListの要素は\(dataListRow)")
        }
        
        
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
        var cubicVolume_millimetor:Double
        var cubicVolume_metor:Double
        var specificGravity:Double
        var weight_ton:Double
        //長さ、幅、厚さを取得
            //空欄はダメ
        if(length != nil && width != nil && height != nil){

        //体積(mm^3) = 長さ(mm) * 幅(mm) * 厚さ(mm)
        cubicVolume_millimetor = Double(length.text!)! * Double(width.text!)! * Double(height.text!)!
        cubicVolume_metor = cubicVolume_millimetor/1000000000
        
        //木の種類から比重を取得する
        specificGravity = dataListSpecificGravity[kindOfWoodNum]
        
        //重さ(t) = 体積(m^3) * 比重
        weight_ton = cubicVolume_metor * specificGravity
        
        //重さ(kg) を表示
        weight.text = String(weight_ton * 1000)
        }else{
            weight.text = "0"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

