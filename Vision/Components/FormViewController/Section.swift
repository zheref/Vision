//
//  Section.swift
//  Vision
//
//  Created by Sergio Daniel L. García on 6/8/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

import Foundation

public struct Section {
    var title: String
    var fields: [Field]
    var collapsable: Bool
    
    public init(title: String, fields: [Field], collapsable: Bool) {
        self.title = title
        self.fields = fields
        self.collapsable = collapsable
    }
}
