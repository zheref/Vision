//
//  ActionTableViewCell.swift
//  Vision
//
//  Created by Sergio Daniel L. García on 6/8/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

import UIKit

class ActionTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var actionButton: UIButton!
    
    // MARK: - Stored properties
    
    var actionClosure: XVSHandler?
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupActionButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Private operations
    
    private func setupActionButton() {
        actionButton.layer.cornerRadius = 12.0
        actionButton.clipsToBounds = true
        actionButton.backgroundColor = tintColor
    }
    
    private func handleEnability(forField field: XVSField) {
        guard let isEnabled = field.options?[.isEnabled] as? Bool else { return }
        actionButton.isEnabled = isEnabled
        
        if isEnabled {
            if field.type == .cta {
                actionButton.backgroundColor = actionButton.tintColor
            }
        } else {
            if field.type == .cta {
                actionButton.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    // MARK: - Operations
    
    func configAsCTA(forField field: XVSField, withHandler handler: XVSHandler?) {
        actionClosure = handler
        actionButton.setTitle(field.title, for: .normal)
        handleEnability(forField: field)
    }
    
    func configAsAction(forField field: XVSField, withHandler handler: XVSHandler?) {
        actionClosure = handler
        actionButton.setTitle(field.title, for: .normal)
        actionButton.backgroundColor = UIColor.clear
        actionButton.setTitleColor(actionButton.tintColor, for: .normal)
        handleEnability(forField: field)
    }
    
    func configAsDelete(forField field: XVSField, withHandler handler: XVSHandler?) {
        actionClosure = handler
        actionButton.setTitle(field.title, for: .normal)
        handleEnability(forField: field)
    }
    
    // MARK: - Actions
    
    @IBAction func userDidTapAction(_ sender: UIButton) {
        actionClosure?()
    }

}
