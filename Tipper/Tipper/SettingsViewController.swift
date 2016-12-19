//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Satyam Jaiswal on 12/18/16.
//  Copyright © 2016 Satyam Jaiswal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var percent1TextField: UITextField!
    
    @IBOutlet weak var percent2TextField: UITextField!
    
    @IBOutlet weak var percent3TextField: UITextField!
    
    @IBOutlet weak var countryPickerView: UIPickerView!
    
    static var countryRowNumber = 60
    
    let defaults = UserDefaults.standard
    
    let countryPickerViewDatasource = ["Afghanistan", "Argentina", "Australia", "Bermuda", "Bolivia", "Bulgaria",                               "Brazil", "Canada", "Chile", "China", "Colombia", "Costa Rica", "Cuba", "Czech Republic", "Denmark", "Egypt", "Georgia", "Ghana", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Israel", "Jamaica", "Japan", "Jersey", "Kazakhstan", "Korea", "Lebanon", "Malaysia", "Mauritius", "Mexico", "Mongolia", "Nepal", "Netherlands", "New Zealand", "Nigeria", "Norway", "Panama", "Paraguay", "Peru", "Philippines", "Poland", "Qatar", "Romania", "Russia", "Saudi Arabia", "Serbia", "Singapore", "South Africa", "Sri Lanka", "Sweden", "Switzerland", "Syria", "Taiwan", "Thailand", "Turkey", "Ukraine", "United States", "United Kingdom", "Viet Nam", "Yemen", "Zimbabwe"]
    
    static let currencySymbols = ["؋", "$", "$", "$", "$b", "лв", "R$", "$", "$", "¥", "$", "₡", "₱", "Kč", "kr", "£", "₾", "¢", "$", "Ft", "kr", "₹", "Rp", "﷼", "₪", "J$", "¥", "£", "лв", "₩", "£", "RM", "₨", "$", "₮", "₨", "ƒ", "$", "₦", "kr", "B/.", "Gs", "S/.", "₱", "zł", "﷼", "lei", "₽", "﷼", "Дин.", "$", "S", "₨", "kr", "CHF", "£", "NT$", "฿", "₺", "₴", "$", "£", "₫", "﷼", "Z$"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countryPickerView.delegate = self
        self.countryPickerView.dataSource = self
        self.countryPickerView.selectRow(SettingsViewController.countryRowNumber, inComponent: 0, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updatePercentTextFields()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.countryPickerViewDatasource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.countryPickerViewDatasource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Country: \(self.countryPickerViewDatasource[row]), Currency: \(SettingsViewController.currencySymbols[row])")
        SettingsViewController.countryRowNumber = row
        HomeViewController.currencySymbol = SettingsViewController.currencySymbols[row]
        defaults.set(row, forKey: "countryRow")
    }
    
    func updatePercentTextFields(){
        self.percent1TextField.text = String(HomeViewController.percentages[0])
        self.percent2TextField.text = String(HomeViewController.percentages[1])
        self.percent3TextField.text = String(HomeViewController.percentages[2])
    }
    
    @IBAction func onPercent1Changed(_ sender: Any) {
        if let percentText = self.percent1TextField.text{
            if let percent = Int(percentText){
                HomeViewController.percentages[0] = percent
                defaults.set(percent, forKey: "tipPercent1")
            }
        }
    }
    
    @IBAction func onPercent2Changed(_ sender: Any) {
        if let percentText = self.percent2TextField.text{
            if let percent = Int(percentText){
                HomeViewController.percentages[1] = percent
                defaults.set(percent, forKey: "tipPercent2")
            }
        }
    }

    @IBAction func onPercent3Changed(_ sender: Any) {
        if let percentText = self.percent3TextField.text{
            if let percent = Int(percentText){
                HomeViewController.percentages[2] = percent
                defaults.set(percent, forKey: "tipPercent3")
            }
        }
    }
    
    
    @IBAction func onTapBackground(_ sender: Any) {
        self.percent1TextField.resignFirstResponder()
        self.percent2TextField.resignFirstResponder()
        self.percent3TextField.resignFirstResponder()
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
