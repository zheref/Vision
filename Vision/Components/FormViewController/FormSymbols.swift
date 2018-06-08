//
//  FormSymbols.swift
//  Vision
//
//  Created by Sergio Daniel L. García on 6/7/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

import Foundation

public enum FieldType {
    
    // Text
    case name
    case text
    case password
    case email
    case phoneNumber
    
    // Number
    case short
    case slider
    case number
    case money
    
    case date
    case time
    case datetime
    
    case options
    case countries
    case timezones
    case currencies
}

public enum FieldSize {
    case regular
    case big
}

public struct Field {
    // MARK: - Stored properties
    
    var title: String
    var type: FieldType
    var size: FieldSize
    var options: FieldOptions?
    
    // MARK: - Initializers
    
    public init(title: String, type: FieldType) {
        self.init(title: title, type: type, size: .regular)
    }
    
    public init(title: String, type: FieldType, size: FieldSize, options: FieldOptions? = nil) {
        self.title = title
        self.type = type
        self.size = size
        self.options = options
    }
}

public struct Section {
    var title: String
    var fields: [Field]
    var collapsable: Bool
}

typealias FieldValuesDict = [String: Any?]

public enum FieldOption {
    case placeholder
    case keyboardColor
    case hasClearButton
}

public typealias FieldOptions = [FieldOption: Any]

protocol FormFieldDelegate {
    
    var currentSavedValue: Any? { get }
    
}
