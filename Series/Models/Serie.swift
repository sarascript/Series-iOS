//
//  Serie.swift
//  Series
//
//  Created by ÁLVARO BARRADO FERNÁNDEZ on 1/10/18.
//  Copyright © 2018 ÁLVARO BARRADO FERNÁNDEZ. All rights reserved.
//

import Foundation


class Serie{
    var name: String!
    var imageFile: String!
    var summary: String!
    var seasons: Int!
    var actores: [Actor]!
    
    init(name: String, imageFile: String, summary:String, seasons:Int, actores:[Actor]){
        self.name = name
        self.imageFile = imageFile
        self.summary = summary
        self.seasons = seasons
        self.actores = actores
    }
}
