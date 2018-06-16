//
//  MainTableViewController.swift
//  VisionDemo
//
//  Created by Sergio Daniel L. García on 6/7/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

import UIKit
import XVision

class MainTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var loginViewCell: UITableViewCell!
    @IBOutlet weak var loginModalViewCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell == loginViewCell {
            showLoginForm()
        } else if cell == loginModalViewCell {
            showLoginFormModally()
        }
    }
    
    private func showLoginForm() {
        let fields = [
            XVSField(title: "E-mail", type: .email, size: .regular, options: [
                .placeholder : "E-mail"
            ]),
            XVSField(title: "Password", type: .password, size: .regular, options: [
                .placeholder : "Password"
            ])
        ]
        
        let vc = XVSFormViewController.instantiate(withName: "login", fields: fields, delegate: self, options: [
            .mode: XVSFormMode.action,
            .actionCopy: "Login"
        ])
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showLoginFormModally() {
        let fields = [
            XVSField(title: "E-mail", type: .email, size: .regular, options: [
                .placeholder : "E-mail"
            ]),
            XVSField(title: "Password", type: .password, size: .regular, options: [
                .placeholder : "Password"
            ])
        ]
        
        let vc = XVSFormViewController.instantiate(withName: "login", fields: fields, delegate: self, options: [
            .presentation: XVSFormPresentation.modal,
            .mode: XVSFormMode.action,
            .actionCopy: "Login"
        ])
        
        present(vc, animated: true, completion: nil)
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

extension MainTableViewController : XVSFormViewControllerDelegate {
    
    func formView(withName formName: String, didAbortWithValues values: XVSFieldValues) {
        print(values)
    }
    
    func formView(withName formName: String, didCompleteWithValues values: XVSFieldValues) {
        print(values)
    }
    
}
