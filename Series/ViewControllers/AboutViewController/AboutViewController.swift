//
//  AboutViewController.swift
//  Series
//
//  Created by SARA CORREAS GORDITO on 15/10/18.
//  Copyright © 2018 ÁLVARO BARRADO FERNÁNDEZ. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    internal var settings: [String] = ["Name", "Songs", "Videos", "Photos", "Applications", "Capacity", "Available", "Version", "Model", "Serial Number", "Legal", "Certificate Trust Settings"]
    internal var data: [String] = ["iPhone", "0", "0", "5", "1", "2 TB", "1.94 TB", "11.3 (15E217)", "993-21559", "DGKHW01ZDHJV", "", ""]
    internal var section: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "About"
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    private func registerCells() {
        let identifier = "About2LabelsCell"
        let cellNib = UINib(nibName: identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: identifier)
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

extension AboutViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 9
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
            cell = createCellForIndexPath(indexPath: indexPath) as About2LabelsCell
        return cell
    }
    
    func createCellForIndexPath(indexPath: IndexPath) -> About2LabelsCell {
        let cell: About2LabelsCell = tableView.dequeueReusableCell(withIdentifier: "About2LabelsCell", for: indexPath) as! About2LabelsCell
        cell.leftLabel.text = settings[indexPath.row]
        cell.rightLabel.text = data[indexPath.row]
        return cell
    }
    
}
