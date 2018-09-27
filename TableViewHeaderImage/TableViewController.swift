//
//  TableViewController.swift
//  TableViewHeaderImage
//
//  Created by Tandem on 06/04/2018.
//  Copyright © 2018 Tandem. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var tv: UITableView!
    private let tvheaderHeight: CGFloat = 300.0
    var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = tv.tableHeaderView
        tv.tableHeaderView = nil
        tv.addSubview(headerView)
        
        tv.contentInset = UIEdgeInsetsMake(tvheaderHeight, 0, 0, 0) // top, left, bottom, right
        tv.contentOffset = CGPoint(x: 0, y: -tvheaderHeight)
        updateHeaderView()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        //to make the nav bar transparent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override var prefersStatusBarHidden: Bool{
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! tableViewCell

        cell.lblTitle.text = "Because we are going to use the header height value in our calculations in several places, we'll add a constant the top of the file. This makes it easier to adj"
        // Configure the cell...

        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
        
        // ****** please read for future use *********
        // the + 200 is for when there is an image in the tableview header, so when pull down, the nav bar and icon slowly animate, nad reach full alpha just exactly when reaches the first row in table view, if no image, maybe just remove the + 200
        var offset = ((scrollView.contentOffset.y  + 200) / 150)
//        var offset = scrollView.contentOffset.y
        print("offset : \(offset)")
        print("scrollView.contentOffset.y : \(scrollView.contentOffset.y)")
        print("scrollView.contentOffset.y / 150 : \(scrollView.contentOffset.y / 150)")
        if offset > 1{
            offset = 1
            let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            self.navigationController?.navigationBar.tintColor = UIColor(hue: 1, saturation: offset, brightness: 1, alpha: 1)
            self.navigationController?.navigationBar.backgroundColor = color
            UIApplication.shared.statusBarView?.backgroundColor = color
        }else{
            print("offset in else : \(offset)")
            let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            self.navigationController?.navigationBar.tintColor = UIColor(hue: 1, saturation: offset, brightness: 1, alpha: 1)
            self.navigationController?.navigationBar.backgroundColor = color
            UIApplication.shared.statusBarView?.backgroundColor = color
            print("changing color here ")
        }
        print("")
    }
    
    func updateHeaderView(){
        var headerRect = CGRect(x: 0, y: -tvheaderHeight, width: tv.bounds.width, height: tvheaderHeight)
        
        if tv.contentOffset.y < -tvheaderHeight{
            headerRect.origin.y = tv.contentOffset.y
            headerRect.size.height = -tv.contentOffset.y
        }
        headerView.frame = headerRect
    }
    
 
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class tableViewCell: UITableViewCell{
    @IBOutlet weak var lblTitle: UILabel!
    
}

