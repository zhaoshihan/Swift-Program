//
//  ViewController.swift
//  DataList
//
//  Created by 赵世晗 on 2019/5/21.
//  Copyright © 2019 赵世晗. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    var cities: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The List"
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "Cell")
    }
    
    @IBAction func addName(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New City",
                                      message: "Add a new city with details",
                                      preferredStyle: .alert)
        alert.addTextField{ (textfield: UITextField) -> Void in
            textfield.placeholder = "input name"
        }
        alert.addTextField{ (textfield: UITextField) -> Void in
            textfield.placeholder = "input postcode"
        }
        alert.addTextField{ (textfield: UITextField) -> Void in
            textfield.placeholder = "input province"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            
            guard let textField1 = alert.textFields?.first,
                let nameToSave = textField1.text else {
                    return
            }
            guard let textField2 = alert.textFields?[1],
                let postcodeToSave = textField2.text else {
                    return
            }
            guard let textField3 = alert.textFields?[2],
                let provinceToSave = textField3.text else {
                    return
            }
            
            self.saveCity(name: nameToSave, postcode: postcodeToSave, province: provinceToSave)
            self.tableView.reloadData()
        }

        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func saveCity(name: String, postcode: String, province: String) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "City",
                                       in: managedContext)!
        
        let city = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        // 3
        city.setValue(name, forKeyPath: "name")
        city.setValue(postcode, forKeyPath: "postcode")
        city.setValue(province, forKeyPath: "province")
        
        // 4
        do {
            try managedContext.save()
            cities.append(city)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let city = cities[indexPath.row]
//            let cell =
//                tableView.dequeueReusableCell(withIdentifier: "Cell",
//                                              for: indexPath)
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellId")
            cell.accessoryType = UITableViewCell.AccessoryType.detailButton
            
            cell.textLabel?.text = city.value(forKeyPath: "name") as? String ?? ""
            cell.detailTextLabel?.numberOfLines = 2
            cell.detailTextLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            cell.detailTextLabel?.text = String.init(city.value(forKeyPath: "postcode")as? String ?? "") + "\n" + String.init(city.value(forKeyPath: "province")as? String ?? "")
            
            return cell
        }
}

