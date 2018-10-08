//
//  ActorsViewController.swift
//  Series
//
//  Created by SARA CORREAS GORDITO on 8/10/18.
//  Copyright © 2018 ÁLVARO BARRADO FERNÁNDEZ. All rights reserved.
//

import UIKit

class ActorsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    internal var actors: [Actor] = []
    
    convenience init(actors: [Actor]) {
        self.init()
        self.actors = actors
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Actors"
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    private func registerCells() {
        let identifier = "ActorCell"
        let cellNib = UINib(nibName: identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: identifier)
        let identifierEmpty = "EmptyStatusCell"
        let cellNibEmpty = UINib(nibName: identifierEmpty, bundle: nil)
        tableView.register(cellNibEmpty, forCellReuseIdentifier: identifierEmpty)
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

extension ActorsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if actors.count == 0 {
            return 1
        } else {
            return actors.count
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if actors.count != 0 {
        return 55.0
        } else {
            return 90.0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if actors.count != 0 {
            cell = createActorCellForIndexPath(indexPath: indexPath) as ActorCell
        } else {
            cell = createEmptyCellForIndexPath(indexPath: indexPath) as EmptyStatusCell
        }
        return cell
    }
    
    func createActorCellForIndexPath(indexPath: IndexPath) -> ActorCell {
        let cell: ActorCell = tableView.dequeueReusableCell(withIdentifier: "ActorCell", for: indexPath) as! ActorCell
        let actor = actors[indexPath.row]
        cell.nameLabel.text = actor.name
        cell.avatarImageView.image = UIImage(named: actor.avatarImage)
        return cell
    }
    
    func createEmptyCellForIndexPath(indexPath: IndexPath) -> EmptyStatusCell {
        let cell: EmptyStatusCell = tableView.dequeueReusableCell(withIdentifier: "EmptyStatusCell", for: indexPath) as! EmptyStatusCell
        return cell
    }
    
}
