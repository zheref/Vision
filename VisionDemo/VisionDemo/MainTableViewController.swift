//
//  MainTableViewController.swift
//  VisionDemo
//
//  Created by Sergio Daniel L. García on 6/7/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

import UIKit
import Vision

class MainTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var loginViewCell: UITableViewCell!

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
        }
    }
    
    private func showLoginForm() {
        let vc = FormViewController.instantiate(withFields: [
            Field(title: "E-mail", type: .email, size: .regular, options: [
                .placeholder : "E-mail"
            ]),
            Field(title: "Password", type: .password, size: .regular, options: [
                .placeholder : "Password"
            ])
        ])
        navigationController?.pushViewController(vc, animated: true)
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
