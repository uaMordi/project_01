//
//  addViewController.swift
//  MissMystique
//
//  Created by Mor Di on 24.10.16.
//  Copyright © 2016 Mor Di. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class addViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,  UITextFieldDelegate {
    
    @IBOutlet weak var codeLbl: UILabel!
    
    @IBOutlet weak var sizeField: UITextField!
    
    @IBOutlet weak var priceField: UITextField!
    
    @IBOutlet weak var costPriceField: UITextField!
    
    @IBOutlet weak var brandPicker: UIPickerView!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet var addBrandView: UIView!
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    @IBOutlet weak var addBrandViewLabel: UILabel!
    
    @IBOutlet weak var addBrandViewTextField: UITextField!
    
    
    //scaned code
    var scan = ""

    
    //brands array 
    var brands = [String]()
    var pickedAnswer = 0
    var value = ""

    // userDefaults
    var def = UserDefaults.standard
    
    
    // Blur
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        
        // gradient
        let color_1 = UIColor(colorLiteralRed: 102/255, green: 199/255, blue: 195/255, alpha: 1.0).cgColor
        let color_2 = UIColor(colorLiteralRed: 30/255, green: 145/255, blue: 140/255, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color_1, color_2]
        gradientLayer.startPoint = CGPoint(x: 0.2, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: -0.2, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        // Fields
        self.sizeField.delegate = self
        self.priceField.delegate = self
        self.costPriceField.delegate = self
        self.addBrandViewTextField.delegate = self
        
        
        // Blur Effect
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        visualEffectView.isHidden = true
        
        // Brand View
        addBrandView.backgroundColor = UIColor.clear
        addBrandView.layer.cornerRadius = 5
        addBrandViewLabel.text = "Добавьте название бренда"
        
        // defaults
        scan = def.string(forKey: "scanCode")!
        codeLbl.text = scan
        brands = def.stringArray(forKey: "brandsArray") ?? [String]()
 
        
        // add Button corner radius
        addButton.layer.cornerRadius = addButton.frame.size.width / 2

        }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sizeField.resignFirstResponder()
        priceField.resignFirstResponder()
        costPriceField.resignFirstResponder()
        addBrandViewTextField.resignFirstResponder()
        
        return (true)
    }
    
    // Picker text color
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let titleData = brands[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSForegroundColorAttributeName: UIColor.white])
        
        return myTitle
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return brands[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     
        return brands.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedAnswer = row
        value = brands[row]
        print(value)
        
    }

    func performAdded(){
        DispatchQueue.main.async(execute: { () -> Void in
            self.performSegue(withIdentifier: "Main", sender: self)
            
        })
    }

    
    func animateIn() {
        self.view.addSubview(addBrandView)
        addBrandView.center = self.view.center
        
        addBrandView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addBrandView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.addBrandView.alpha = 1
            self.addBrandView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut () {
        UIView.animate(withDuration: 0.3, animations: {
            self.addBrandView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addBrandView.alpha = 0
            
            self.visualEffectView.effect = nil
            
        }) { (success:Bool) in
            self.addBrandView.removeFromSuperview()
        }
    }
    
    
    
    
//MARK: ADD Button
    @IBAction func addButton(_ sender: AnyObject) {
        
        let scanCodeDef = def.string(forKey: "scanCode")!
       
        // scaned code
        def.set(scanCodeDef, forKey: "\(scanCodeDef)_scanCode")
        
        // brand
        let brandText = value
        def.set(brandText, forKey: "\(scanCodeDef)_brand")

        
        // size 
        let sizeText = sizeField.text
        def.set(sizeText, forKey: "\(scanCodeDef)_size")
        
        // price 
        let priceText = Int(priceField.text!)
        def.set(priceText, forKey: "\(scanCodeDef)_price")
        
        // cost price
        let costPriceText = Int(costPriceField.text!)
        def.set(costPriceText, forKey: "\(scanCodeDef)_costPrice")
        
        performAdded()
        
      }
    
    @IBAction func addBrand(_ sender: Any) {
       
        visualEffectView.isHidden = false
        animateIn()
    }
    
    @IBAction func addedBrandButton(_ sender: Any) {
        
        let newBrand = addBrandViewTextField.text
        brands.append(newBrand!)
        brandPicker.reloadAllComponents()
        def.set(brands, forKey: "brandsArray")
        animateOut()
        visualEffectView.isHidden = true
    }
    
    @IBAction func backButton(_ sender: Any) {
        animateOut()
        visualEffectView.isHidden = true
    }
}
