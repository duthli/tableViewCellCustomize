//
//  DetailVC.swift
//  customize tableviewcell
//
//  Created by do duy hung on 14/09/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var nameImg:String!
    var nameTitle:String!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        image.image = UIImage(named: nameImg!)
        self.title = nameTitle
        
    }
}
