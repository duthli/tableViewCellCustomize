//
//  Data.swift
//  customize tableviewcell
//
//  Created by do duy hung on 14/09/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit
class dataItem{
    var imageLogo : UIImage!
    var name : String!
    var stat : String!
    var imageRating:UIImage!
    
    init(imgLogo : String, name_: String,stat_:String,imgstar:Int){
        self.imageLogo = UIImage(named: imgLogo)
        self.name = name_
        self.stat = stat_
        self.imageRating = UIImage(named: "\(imgstar)stars.png")
    }
}