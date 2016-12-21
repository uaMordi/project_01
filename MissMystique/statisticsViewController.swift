//
//  statisticsViewController.swift
//  MissMystique
//
//  Created by Mor Di on 30.11.16.
//  Copyright © 2016 Mor Di. All rights reserved.
//

import UIKit

class statisticsViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var soldLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var netProfitLabel: UILabel!
    
    
    var pageIndex: Int!
    var titleText: String!
    var soldText: Int!
    var priceText: Int!
    var netProfitText: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backItem?.title = ""
        navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.white

        let color_1 = UIColor(colorLiteralRed: 102/255, green: 199/255, blue: 195/255, alpha: 1.0).cgColor
        let color_2 = UIColor(colorLiteralRed: 30/255, green: 145/255, blue: 140/255, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color_1, color_2]
        gradientLayer.startPoint = CGPoint(x: 0.2, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: -0.2, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
         self.titleLable.text = self.titleText
         self.soldLabel.text = "Sold   \(String(self.soldText))"
         self.priceLabel.text = "Profit  \(String(self.priceText))"
         self.netProfitLabel.text = "Net profit   \(String(self.netProfitText))"
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
