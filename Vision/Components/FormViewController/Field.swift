//
//  Field.swift
//  Vision
//
//  Created by Sergio Daniel L. García on 6/8/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

import Foundation

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
