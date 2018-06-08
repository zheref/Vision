//
//  TextTableViewCell.swift
//  Vision
//
//  Created by Sergio Daniel L. García on 6/7/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var textField: UITextField!

    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: Operations
    
    func configAsName(forField field: Field) {
        textField.autocapitalizationType = .words
        
        handleClearButtonMode(fromOptions: field.options)
        handlePlaceholder(forField: field)
    }
    
    func configAsEmail(forField field: Field) {
        textField.keyboardType = .emailAddress
        
        handleClearButtonMode(fromOptions: field.options)
        handlePlaceholder(forField: field)
    }
    
    func configAsPassword(forField field: Field) {
        textField.isSecureTextEntry = true
        
        handleClearButtonMode(fromOptions: field.options)
        handlePlaceholder(forField: field)
    }
    
    func configAsText(forField field: Field) {
        handleClearButtonMode(fromOptions: field.options)
        handlePlaceholder(forField: field)
    }
    
    func configAsPhoneNumber(forField field: Field) {
        textField.keyboardType = .namePhonePad
        
        handleClearButtonMode(fromOptions: field.options)
        handlePlaceholder(forField: field)
    }
    
    // MARK: - Private operations
    
    private func handleClearButtonMode(fromOptions options: FieldOptions?) {
        if let hasClearButton = options?[.hasClearButton] as? Bool {
            textField.clearButtonMode = hasClearButton ? .whileEditing : .never
        } else {
            textField.clearButtonMode = .whileEditing
        }
    }
    
    private func handlePlaceholder(forField field: Field) {
        if let placeholder = field.options?[.placeholder] as? String {
            textField.placeholder = placeholder
        } else {
            textField.placeholder = field.title
        }
    }

}

extension TextTableViewCell : FormFieldDelegate {
    
    var currentSavedValue: Any? {
        return textField.text
    }
    
}
