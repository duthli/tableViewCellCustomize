//
//  MasterTableVC.swift
//  customize tableviewcell
//
//  Created by do duy hung on 14/09/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class MasterTableVC: UITableViewController {
    var arrayData : [dataItem]!
    var detailVC : DetailVC!
    var dict: NSDictionary!
    var arrKeys: NSArray!
    var arrVals: NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1: dataItem = dataItem.init(imgLogo: "pistol0.png", name_: "Glock", stat_: "cuibap", imgstar: 1)
        arrayData = [item1]
        addGun()
        
        
        tableView.registerNib(UINib(nibName: "masterCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
    }
    
    func addGun(){
        let path = NSBundle.mainBundle().pathForResource("ListGun", ofType: "plist")
        
        dict = NSDictionary(contentsOfFile: path!)!
        arrKeys = dict.allKeys
        arrVals = dict.allValues
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrKeys.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell : customCellMaster! = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! customCellMaster
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! masterCell
        
        let item : dataItem = dataItem.init(imgLogo: arrVals[indexPath.row] as! String, name_: arrKeys[indexPath.row] as! String, stat_: "Pistols", imgstar: Int(arc4random_uniform(UInt32(4)))+1)
        arrayData.append(item)
        cell.label_Name.text = item.name
        cell.label_Stat.text = item.stat
        cell.image_Logo.image = item.imageLogo
        cell.image_Star.image = item.imageRating
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (detailVC == nil){
        
            detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as! DetailVC
        }
        let item :dataItem = arrayData[indexPath.row]
        detailVC.nameImg = arrVals[indexPath.row] as! String
        detailVC.nameTitle = arrKeys[indexPath.row] as! String
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

}
