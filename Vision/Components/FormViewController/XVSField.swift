//
//  Field.swift
//  Vision
//
//  Created by Sergio Daniel L. García on 6/8/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

import Foundation

public struct XVSField {
    // MARK: - Stored properties
    
    var title: String
    var type: XVSFieldType
    var size: XVSFieldSize
    var options: XVSFieldOptions?
    
    // MARK: - Initializers
    
    public init(title: String, type: XVSFieldType) {
        self.init(title: title, type: type, size: .regular)
    }
    
    public init(title: String, type: XVSFieldType, size: XVSFieldSize, options: XVSFieldOptions? = nil) {
        self.title = title
        self.type = type
        self.size = size
        self.options = options
    }
}
