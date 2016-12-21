//
//  readViewController.swift
//  MissMystique
//
//  Created by Mor Di on 31.10.16.
//  Copyright © 2016 Mor Di. All rights reserved.
//

import UIKit

class readViewController: UIViewController {

    @IBOutlet weak var brandLbl: UILabel!
    
    @IBOutlet weak var sizeLbl: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var costPriceLbl: UILabel!
    
    @IBOutlet weak var codeLbl: UILabel!
    
    @IBOutlet weak var sold: UIButton!
    
    let def = UserDefaults.standard
    var scanCodeDef = ""
    
    // Date
    let calendar = Calendar.current
    let date = Date()
    let dateComponents = DateComponents()
    var month = String()
    var dateArray = [Date]()
    
    var profit = Int()
    var netProfit = Int()
    
    //
    var soldCount = 0
    var pricex = 0
    var price = 0
    var costPrice = 0
    var costPriceX = 0
 
    var brand = String()
    var size = String()
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.white

        let color_1 = UIColor(colorLiteralRed: 102/255, green: 199/255, blue: 195/255, alpha: 1.0).cgColor
        let color_2 = UIColor(colorLiteralRed: 30/255, green: 145/255, blue: 140/255, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color_1, color_2]
        gradientLayer.startPoint = CGPoint(x: 0.2, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: -0.2, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        // sold Button corner radius
        sold.layer.cornerRadius = sold.frame.size.width / 2

        
        // Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        month = dateFormatter.string(from: date)
        
        
        // Defaults
        scanCodeDef = def.string(forKey: "scanCode")!
        soldCount = def.integer(forKey: "\(month)_sold")
        costPrice = def.integer(forKey: "\(month)_costPrice")

        
        // labels
        let code = def.string(forKey: "\(scanCodeDef)_scanCode")
        codeLbl.text = "id \(code!)"
        
        size = def.string(forKey: "\(scanCodeDef)_size")!
        sizeLbl.text = "size \(size)"
        
        brand = def.string(forKey: "\(scanCodeDef)_brand")!
        let brandText = String("brand \(brand)")!
        brandLbl.text = brandText
        
        price = def.integer(forKey: "\(scanCodeDef)_price")
        let priceText = String("price \(price)")!
        priceLbl.text = priceText
        
    
        let x = def.integer(forKey: "\(month)_profit")
        if x >= 0 {
            pricex = x
        }
        
        let y = def.integer(forKey: "\(month)_profit")
        if y >= 0 {
            costPriceX = y
        }
        
        costPriceLbl.isHidden = true
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func performSold(){
        DispatchQueue.main.async(execute: { () -> Void in
            self.performSegue(withIdentifier: "SoldToMain", sender: self)
            
        })
    }

    
    
    @IBAction func soldButton(_ sender: Any) {
 
        
        // Month
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        
        let month = dateFormatter.string(from: date)
        
        // Price
        pricex = pricex + price
        def.set(pricex, forKey: "\(month)_profit")
        
       
        // costPrice
        costPriceX = costPriceX + costPrice
        def.set(costPriceX, forKey: "\(month)_costPrice")
      
        // Sold
        
        soldCount += 1
        def.set(soldCount, forKey: "\(month)_sold")
        
        
        // Delete from defaults
        
        def.removeObject(forKey: "scanCode")
        
        def.removeObject(forKey: "\(scanCodeDef)_scanCode")

        def.removeObject(forKey: "\(scanCodeDef)_brand")

        def.removeObject(forKey: "\(scanCodeDef)_size")

        def.removeObject(forKey: "\(scanCodeDef)_price")

        def.removeObject(forKey: "\(scanCodeDef)_costPrice")

        performSold()
        
    }

    


   

}
