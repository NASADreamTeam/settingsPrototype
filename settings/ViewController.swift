//
//  ViewController.swift
//  settings
//
//  Created by Student on 4/30/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            
            
        }
    }
    
    let listName = ["one", "two", "three"]
    
    var textFieldList = [UITextField]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.textFieldDidExitEditing))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "panelEfficiency") as! TextFieldTableViewCell
        
        cell.nameLabel.text = listName[indexPath.row]//"static"
        cell.valueTextField.placeholder = "test"
        
        cell.valueTextField.tag = indexPath.row
        self.textFieldList.append(cell.valueTextField)
        
        
        //print("TAG: \(cell.valueTextField.tag)")
        //cell.valueTextField.addTarget(self, action: #selector(self.textFieldDidExitEditing(sender:)), for: UIControlEvents.editingDidEndOnExit)
        
        // link textfield .EndOnExit callback/whatever to a function
        
        // For each location in the tableView, as specified by the indexPath, return the correct, already exiting UITableViewCell
//        if indexPath.row == 0 && indexPath.section == 0 {
//            cell = tableView.dequeueReusableCell(withIdentifier: "panelEfficiency") as! TextFieldTableViewCell
//            
//            cell.
//            
//        } else if indexPath.row == 1 && indexPath.section == 0 {
//            cell = tableView.dequeueReusableCell(withIdentifier: "panelArea")!
//        } else if indexPath.row == 2 && indexPath.section == 0 {
//            cell = tableView.dequeueReusableCell(withIdentifier: "numberOfPanels")!
//        } else {
//            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "error: No cell for this IndexPath.")
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(indexPath)")
    }
    // TODO: UserDefaults should populate TableView on load
    func textFieldDidExitEditing() {
    //func textFieldDidExitEditing(sender: UITextField) {
        for item in textFieldList {
        switch item.tag {
        case 0:
            if let value = item.text, !value.isEmpty {
                let doubleValue = Double(value)
                // save to defaults.
                UserDefaults.standard.set(doubleValue, forKey: "efficiency")
                print("0")

            }
        case 1:
            if let value = item.text, !value.isEmpty {
                let doubleValue = Double(value)
                // save to defaults.
                UserDefaults.standard.set(doubleValue, forKey: "panelArea")
                print("1")

            }
        case 2:
            if let value = item.text, !value.isEmpty {
                let doubleValue = Double(value)
                // save to defaults.
                UserDefaults.standard.set(doubleValue, forKey: "panelCount")
                print("2")

            }
        default:
            print("FATAL ERROR INDEX OUTA BOUNDS")
            }
        }
        // set user defaults here.. using switch case to determine textfield.
        self.view.endEditing(true)
        
    }


}

