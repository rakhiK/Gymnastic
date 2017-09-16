//
//  HomeVC.swift
//  Gymnastics
//
//  Created by Rakhi on 9/9/17.
//  Copyright © 2017 rakhi. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var tblHomeList: UITableView!
    
    let textFieldArray = ["Gymnastics Mentor Premium 50% off with Annual Subscription", "Stuart Redmond has 7 pending ticks awaiting approval", "Your monthly video download allowance has been topped up!", "New videos have been added to Bar(Grade 4)", "Learn more about the Gymnastics Mentor app", "Stuart Redmond has Completed Grade 3"]
    let imgArray = ["1.png", "2.png","3.png", "4.png", "5.png", "6.png"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.title = "Home"
        
    }

    // Mark : Table Datasource methods
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return textFieldArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tblHomeList.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! HomeCell
        let registerImages = UIImage(named: imgArray[indexPath.row])
        cell.imageIcon.image = registerImages
        cell.lblName.text = textFieldArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
