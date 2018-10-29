//
//  ChatsViewController.swift
//  Series
//
//  Created by SARA CORREAS GORDITO on 29/10/18.
//  Copyright © 2018 ÁLVARO BARRADO FERNÁNDEZ. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {

    init() {
        super.init(nibName: "ChatsViewController", bundle: nil)
        self.tabBarItem.image = UIImage(named: "chats")
        self.title = NSLocalizedString("title_chats", comment: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeColorPressed() {
        
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
