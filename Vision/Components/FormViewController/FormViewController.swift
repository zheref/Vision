//
//  FormViewController.swift
//  Vision
//
//  Created by Sergio Lozano García on 6/6/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

import UIKit

public class FormViewController: UITableViewController {
    
    // MARK: Class members
    
    // MARK: - Stored properties
    
    private var sections = [Section]()
    
    // MARK: - Initializers
    
    public static func instantiate(withFields fields: [Field]) -> FormViewController {
        return instantiate(withSections: [
            Section(title: String(), fields: fields, collapsable: false)
        ])
    }
    
    public static func instantiate(withSections sections: [Section]) -> FormViewController {
        let storyboard = UIStoryboard(name: K.Storyboard.FormViewController,
                                    bundle: Bundle(for: FormViewController.self))
        let vc = storyboard.instantiateInitialViewController() as! FormViewController
        vc.sections = sections
        return vc
    }
    
    // MARK: - Lifecycle

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    public override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionItem = sections[section]
        return sectionItem.fields.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let field = section.fields[indexPath.row]
        
        switch field.type {
        case .name:
            let identifier = K.ReuseIdentifier.textViewCellReuseIdentifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath)
            
            if let textCell = cell as? TextTableViewCell {
                textCell.configAsName(forField: field)
            }
            
            return cell
        case .email:
            let identifier = K.ReuseIdentifier.textViewCellReuseIdentifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath)
            
            if let textCell = cell as? TextTableViewCell {
                textCell.configAsEmail(forField: field)
            }
            
            return cell
        case .password:
            let identifier = K.ReuseIdentifier.textViewCellReuseIdentifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath)
            
            if let textCell = cell as? TextTableViewCell {
                textCell.configAsPassword(forField: field)
            }
            
            return cell
        case .text:
            let identifier = K.ReuseIdentifier.textViewCellReuseIdentifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath)
            
            if let textCell = cell as? TextTableViewCell {
                textCell.configAsText(forField: field)
            }
            
            return cell
        case .phoneNumber:
            let identifier = K.ReuseIdentifier.textViewCellReuseIdentifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath)
            
            if let textCell = cell as? TextTableViewCell {
                textCell.configAsPhoneNumber(forField: field)
            }
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            return cell
        }
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.section]
        let field = section.fields[indexPath.row]
        
        switch field.size {
        case .regular:
            return 44.0
        case .big:
            return 80.0
        }
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
