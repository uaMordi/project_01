//
//  stViewController.swift
//  MissMystique
//
//  Created by Mor Di on 30.11.16.
//  Copyright © 2016 Mor Di. All rights reserved.
//

import UIKit

class stViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController!
    
    var pageTitles = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]
    var sold = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var price = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var netProfit = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    var profit = 0
    
    let def = UserDefaults.standard
    
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
     
        
       // defaults
        
        let priceJan = def.integer(forKey: "Jan_profit")
        let priceFeb = def.integer(forKey: "Feb_profit")
        let priceMar = def.integer(forKey: "Mar_profit")
        let priceApr = def.integer(forKey: "Apr_profit")
        let priceMay = def.integer(forKey: "May_profit")
        let priceJune = def.integer(forKey: "June_profit")
        let priceJuly = def.integer(forKey: "July_profit")
        let priceAug = def.integer(forKey: "Aug_profit")
        let priceSept = def.integer(forKey: "Sept_profit")
        let priceOct = def.integer(forKey: "Oct_profit")
        let priceNov = def.integer(forKey: "Nov_profit")
        let priceDec = def.integer(forKey: "Dec_profit")
        
        let soldJan = def.integer(forKey: "Jan_sold")
        let soldFeb = def.integer(forKey: "Feb_sold")
        let soldMar = def.integer(forKey: "Mar_sold")
        let soldApr = def.integer(forKey: "Apr_sold")
        let soldMay = def.integer(forKey: "May_sold")
        let soldJune = def.integer(forKey: "June_sold")
        let soldJuly = def.integer(forKey: "July_sold")
        let soldAug = def.integer(forKey: "Aug_sold")
        let soldSept = def.integer(forKey: "Sept_sold")
        let soldOct = def.integer(forKey: "Oct_sold")
        let soldNov = def.integer(forKey: "Nov_sold")
        let soldDec = def.integer(forKey: "Dec_sold")
        
        let costPriceJan = def.integer(forKey: "Jan_costPrice")
        let costPriceFeb = def.integer(forKey: "Feb_costPrice")
        let costPriceMar = def.integer(forKey: "Mar_costPrice")
        let costPriceApr = def.integer(forKey: "Apr_costPrice")
        let costPriceMay = def.integer(forKey: "May_costPrice")
        let costPriceJune = def.integer(forKey: "June_costPrice")
        let costPriceJuly = def.integer(forKey: "July_costPrice")
        let costPriceAug = def.integer(forKey: "Aug_costPrice")
        let costPriceSept = def.integer(forKey: "Sept_costPrice")
        let costPriceOct = def.integer(forKey: "Oct_costPrice")
        let costPriceNov = def.integer(forKey: "Nov_costPrice")
        let costPriceDec = def.integer(forKey: "Dec_costPrice")

       
        if priceJan >= 0 {
            price[0] = priceJan
            sold[0] = soldJan
            profit = priceJan - costPriceJan
            netProfit[0] = profit
            
        }
        if priceFeb >= 0 {
            price[1] = priceFeb
            sold[1] = soldFeb
            profit = priceFeb - costPriceFeb
            netProfit[1] = profit
        }

        if priceMar >= 0 {
            price[2] = priceMar
            sold[2] = soldMar
            profit = priceMar - costPriceMar
            netProfit[2] = profit
        }

        if priceApr >= 0 {
            price[3] = priceApr
            sold[3] = soldApr
            profit = priceApr - costPriceApr
            netProfit[3] = profit
        }

        if priceMay >= 0 {
            price[4] = priceMay
            sold[4] = soldMay
            profit = priceMay - costPriceMay
            netProfit[4] = profit
        }

        if priceJune >= 0 {
            price[5] = priceJune
            sold[5] = soldJune
            profit = priceJune - costPriceJune
            netProfit[5] = profit
        }

        if priceJuly >= 0 {
            price[6] = priceJuly
            sold[6] = soldJuly
            profit = priceJuly - costPriceJuly
            netProfit[6] = profit
        }

        if priceAug >= 0 {
            price[7] = priceAug
             sold[7] = soldAug
            profit = priceAug - costPriceAug
            netProfit[7] = profit
        }

        if priceSept >= 0 {
            price[8] = priceSept
            sold[8] = soldSept
            profit = priceSept - costPriceSept
            netProfit[8] = profit
        }

        if priceOct >= 0 {
            price[9] = priceOct
            sold[9] = soldOct
            profit = priceOct - costPriceOct
            netProfit[9] = profit
        }

        if priceNov >= 0 {
            price[10] = priceNov
                sold[10] = soldNov
            profit = priceNov - costPriceNov
            netProfit[10] = profit
        }

        if priceDec >= 0 {
            price[11] = priceDec
             sold[11] = soldDec
            profit = priceDec - costPriceDec
            netProfit[11] = profit
        }


        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(index: 0) as statisticsViewController
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers((viewControllers as! [UIViewController]), direction: .forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: self.view.frame.size.height - 60)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func viewControllerAtIndex(index: Int) -> statisticsViewController {
        
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
           
            return statisticsViewController()
        }
        
        let vc: statisticsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! statisticsViewController
        
        vc.titleText = self.pageTitles[index] 
        vc.soldText = self.sold[index]
        vc.priceText = self.price[index]
        vc.netProfitText = self.netProfit[index]
        vc.pageIndex = index
        
        return vc
    }
    
    // MARK: Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! statisticsViewController
        var index = vc.pageIndex as Int
        
        if (index == 0 || index == NSNotFound) {
            
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index: index)
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! statisticsViewController
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound) {
            return nil
        }
        
        index += 1
        if (index == self.pageTitles.count) {
            return nil
        }
        
        return self.viewControllerAtIndex(index: index)
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return self.pageTitles.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        return 0
    }
    
    
    
    
    
    
    
    
    
}
