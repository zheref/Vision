//
//  FormViewController.swift
//  Vision
//
//  Created by Sergio Lozano García on 6/6/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

import UIKit

public protocol XVSFormViewControllerDelegate : class {
    
    func formView(withName formName: String, didAbortWithValues values: XVSFieldValues)
    func formView(withName formName: String, didCompleteWithValues values: XVSFieldValues)
    
}

public class XVSFormViewController: UITableViewController {
    
    // MARK: Class members
    
    // MARK: - Stored properties
    
    private var name = String()
    private var sections = [XVSSection]()
    
    private weak var delegate: XVSFormViewControllerDelegate?
    
    private var options: XVSFormOptions? {
        didSet {
            if let mode = options?[.mode] as? XVSFormMode,
                mode == .action {
                
                let actionCopy = options?[.actionCopy] as? String ?? "Done"
                let actionField = XVSField(title: actionCopy, type: .cta, size: .medium)
                let actionSection = XVSSection(title: "", fields: [actionField], collapsable: false)
                sections.append(actionSection)
            }
        }
    }
    
    // MARK: - Computed properties
    
    private var mode: XVSFormMode {
        return options?[.mode] as? XVSFormMode ?? .action
    }
    
    private var currentValues: XVSFieldValues {
        var values = [String: Any?]()
        
        var sectionIterator = 0
        
        for section in sections {
            var fieldIterator = 0
            
            for field in section.fields {
                let indexPath = IndexPath(row: fieldIterator, section: sectionIterator)
                
                if let cell = tableView.cellForRow(at: indexPath) as? FormFieldDelegate {
                    values[field.title] = cell.currentSavedValue
                }
                
                fieldIterator += 1
            }
            
            sectionIterator += 1
        }
        
        return values
    }
    
    // MARK: - Initializers
    
    public static func instantiate(withName name: String,
                                   fields: [XVSField],
                                   delegate: XVSFormViewControllerDelegate? = nil,
                                   options: XVSFormOptions? = nil) -> UIViewController {
        
        let sections = [
            XVSSection(title: String(), fields: fields, collapsable: false)
        ]
        
        return instantiate(withName: name,
                           sections: sections,
                           delegate: delegate,
                           options: options)
    }
    
    public static func instantiate(withName name: String,
                                   sections: [XVSSection],
                                   delegate: XVSFormViewControllerDelegate?,
                                   options: XVSFormOptions? = nil) -> UIViewController {
        
        let presentation = options?[.presentation] as? XVSFormPresentation
        
        let storyboard = UIStoryboard(name: K.Storyboard.FormViewController,
                                    bundle: Bundle(for: XVSFormViewController.self))
        let vc = storyboard.instantiateInitialViewController() as! XVSFormViewController
        
        vc.name = name
        vc.sections = sections
        vc.delegate = delegate
        vc.options = options
        
        if presentation == .modal {
            vc.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                                  target: vc,
                                                                  action: #selector(userDidTapToAbort(sender:)))
            
            return UINavigationController(rootViewController: vc)
        } else {
            return vc
        }
    }
    
    // MARK: - Lifecycle

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //tableView.separatorColor = UIColor.clear
        
        setupActions()
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private operations
    
    private func setupActions() {
        switch mode {
        case .action:
            break
        case .new:
            break
        case .edit:
            break
        case .editDelete:
            break
        case .view:
            break
        }
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
            let identifier = K.ReuseIdentifier.textViewCellReuseId
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath)
            
            //cell.separatorInset = UIEdgeInsetsMake(0.0, cell.bounds.size.width, 0.0, 0.0)
            
            if let textCell = cell as? TextTableViewCell {
                textCell.configAsName(forField: field)
            }
            
            return cell
        case .email:
            let identifier = K.ReuseIdentifier.textViewCellReuseId
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath)
            
            //cell.separatorInset = UIEdgeInsetsMake(0.0, cell.bounds.size.width, 0.0, 0.0)
            
            if let textCell = cell as? TextTableViewCell {
                textCell.configAsEmail(forField: field)
            }
            
            return cell
        case .password:
            let identifier = K.ReuseIdentifier.textViewCellReuseId
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath)
            
            //cell.separatorInset = UIEdgeInsetsMake(0.0, cell.bounds.size.width, 0.0, 0.0)
            
            if let textCell = cell as? TextTableViewCell {
                textCell.configAsPassword(forField: field)
            }
            
            return cell
        case .text:
            let identifier = K.ReuseIdentifier.textViewCellReuseId
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath)
            
            //cell.separatorInset = UIEdgeInsetsMake(0.0, cell.bounds.size.width, 0.0, 0.0)
            
            if let textCell = cell as? TextTableViewCell {
                textCell.configAsText(forField: field)
            }
            
            return cell
        case .phoneNumber:
            let identifier = K.ReuseIdentifier.textViewCellReuseId
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath)
            
            //cell.separatorInset = UIEdgeInsetsMake(0.0, cell.bounds.size.width, 0.0, 0.0)
            
            if let textCell = cell as? TextTableViewCell {
                textCell.configAsPhoneNumber(forField: field)
            }
            
            return cell
        case .cta:
            let identifier = K.ReuseIdentifier.actionViewCellReuseId
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath)
            
            if let actionCell = cell as? ActionTableViewCell {
                actionCell.configAsCTA(forField: field) { [unowned self] in
                    self.userDidTapToConfirm(sender: actionCell)
                }
            }
            
            return cell
        case .action:
            let identifier = K.ReuseIdentifier.actionViewCellReuseId
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath)
            
            if let actionCell = cell as? ActionTableViewCell {
                actionCell.configAsAction(forField: field) {
                    
                }
            }
            
            return cell
        case .deleteAction:
            let identifier = K.ReuseIdentifier.actionViewCellReuseId
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath)
            
            if let actionCell = cell as? ActionTableViewCell {
                actionCell.configAsDelete(forField: field) {
                    
                }
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
        case .medium:
            return 50.0
        case .big:
            return 56.0
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
    
    // MARK: - Actions
    
    @objc func userDidTapToAbort(sender: UIBarButtonItem) {
        if let presentation = options?[.presentation] as? XVSFormPresentation,
            presentation == .modal {
            dismiss(animated: true) { [unowned self] in
                self.delegate?.formView(withName: self.name, didAbortWithValues: self.currentValues)
            }
        } else {
            delegate?.formView(withName: name, didAbortWithValues: currentValues)
        }
    }
    
    @objc func userDidTapToConfirm(sender: Any) {
        if let presentation = options?[.presentation] as? XVSFormPresentation,
            presentation == .modal {
            dismiss(animated: true) { [unowned self] in
                self.delegate?.formView(withName: self.name, didCompleteWithValues: self.currentValues)
            }
        } else {
            navigationController?.popViewController(animated: true)
            delegate?.formView(withName: name, didCompleteWithValues: currentValues)
        }
    }

}