//
//  FormSymbols.swift
//  Vision
//
//  Created by Sergio Daniel L. García on 6/7/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

import Foundation

public enum FieldSize {
    case regular
    case medium
    case big
}

public typealias FieldValues = [String: Any?]

public typealias FormOptions = [FormOption: Any]

public enum FormOption {
    case mode
    case actionCopy
    case navTitle
    case image
    case theme
}

public enum FormTheme {
    case light
    case dark
}

public enum FormMode {
    case new
    case edit
    case editDelete
    case view
    case action
}

public enum FieldOption {
    case placeholder
    case keyboardColor
    case hasClearButton
}

public typealias FieldOptions = [FieldOption: Any]

protocol FormFieldDelegate {
    
    var currentSavedValue: Any? { get }
    
}
