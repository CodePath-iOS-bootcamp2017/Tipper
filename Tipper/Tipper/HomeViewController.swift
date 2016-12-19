//
//  HomeViewController.swift
//  Tipper
//
//  Created by Satyam Jaiswal on 12/18/16.
//  Copyright © 2016 Satyam Jaiswal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var percentageSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var tipCaptionLabel: UILabel!
    
    @IBOutlet weak var totalCaptionLabel: UILabel!
    
    @IBOutlet weak var tipDollarSignLabel: UILabel!
    
    @IBOutlet weak var totalDollarSignLabel: UILabel!
    
    @IBOutlet weak var splitNumberTextField: UITextField!
    
    @IBOutlet weak var shareAmountLabel: UILabel!
    

    @IBOutlet weak var splitView: UIView!

    @IBOutlet weak var billDollarLabel: UILabel!
    
    @IBOutlet weak var shareDollarLabel: UILabel!
    
    @IBOutlet weak var shareCaptionLabel: UILabel!
    
    var payAmount = 0.00
    static var percentages = [10, 20, 30]
    static var currencySymbol = "$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideLabels()
        self.shareAmountLabel.isHidden = true
        self.shareDollarLabel.isHidden = true
        self.shareCaptionLabel.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updatePercentSegmentedControl()
        updateCurrencySymbolLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updatePercentSegmentedControl(){
        self.percentageSegmentedControl.setTitle("\(HomeViewController.percentages[0])%", forSegmentAt: 0)
        self.percentageSegmentedControl.setTitle("\(HomeViewController.percentages[1])%", forSegmentAt: 1)
        self.percentageSegmentedControl.setTitle("\(HomeViewController.percentages[2])%", forSegmentAt: 2)
    }

    func updateCurrencySymbolLabels(){
        self.tipDollarSignLabel.text = HomeViewController.currencySymbol
        self.totalDollarSignLabel.text = HomeViewController.currencySymbol
        self.shareDollarLabel.text = HomeViewController.currencySymbol
        self.billDollarLabel.text = HomeViewController.currencySymbol
    }
    
    @IBAction func calculateTip(_ sender: Any) {
//        print("onAmountChanged called")
        
        if let bill = self.billAmountTextField.text{
            if let billAmount = Double(bill){
                self.showLabels()
                
                let tipAmount = billAmount * Double(HomeViewController.percentages[percentageSegmentedControl.selectedSegmentIndex])/100
                let totalAmount = billAmount + tipAmount
                self.totalAmountLabel.text = String(format: "%.2f", totalAmount)
                self.tipLabel.text = String(format: "%.2f", tipAmount)
                
                self.payAmount = totalAmount
                self.onSplitUpdate(sender)
                /*
                var numberFormatter = NumberFormatter()
                numberFormatter.formatterBehavior = NumberFormatter.Behavior.behavior10_4
                numberFormatter.numberStyle = NumberFormatter.Style.currency
//                numberFormatter.locale = locale
                print(numberFormatter.string(from: 25) ?? 23)
                */
                
            }else{
                print("\(bill) can't be converted to double")
                self.hideLabels()
            }
        }else{
            print("bill field empty")
        }
    }
    
    @IBAction func tipPercentageChange(_ sender: Any) {
        calculateTip(sender)
    }
    
    
    @IBAction func onTapBackground(_ sender: Any) {
        
        self.billAmountTextField.resignFirstResponder()
        self.splitNumberTextField.resignFirstResponder()
    }
    
    func hideLabels(){
        self.tipCaptionLabel.isHidden = true
        self.totalCaptionLabel.isHidden = true
        self.tipLabel.isHidden = true
        self.totalAmountLabel.isHidden = true
        self.tipDollarSignLabel.isHidden = true
        self.totalDollarSignLabel.isHidden = true
        self.splitView.isHidden = true
    }
    
    func showLabels(){
        self.tipCaptionLabel.isHidden = false
        self.totalCaptionLabel.isHidden = false
        self.tipLabel.isHidden = false
        self.totalAmountLabel.isHidden = false
        self.tipDollarSignLabel.isHidden = false
        self.totalDollarSignLabel.isHidden = false
        self.splitView.isHidden = false
    }
    
    
    @IBAction func onSplitUpdate(_ sender: Any) {
        if let splitNumberText = self.splitNumberTextField.text{
            if let splitNumber = Int(splitNumberText){
                self.shareAmountLabel.isHidden = false
                self.shareDollarLabel.isHidden = false
                self.shareCaptionLabel.isHidden = false
                self.shareAmountLabel.text = String(format: "%.2f", (self.payAmount/Double(splitNumber)))
            }else{
                self.shareAmountLabel.isHidden = true
                self.shareDollarLabel.isHidden = true
                self.shareCaptionLabel.isHidden = true
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
