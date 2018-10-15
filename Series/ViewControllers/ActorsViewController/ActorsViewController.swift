//
//  ActorsViewController.swift
//  Series
//
//  Created by SARA CORREAS GORDITO on 8/10/18.
//  Copyright © 2018 ÁLVARO BARRADO FERNÁNDEZ. All rights reserved.
//

import UIKit
import SDWebImage

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
        setupBarButtonItems()
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
    
    private func setupBarButtonItems() {
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPressed))
        navigationItem.setRightBarButton(addBarButton, animated: false)
    }
    
    @objc private func addPressed() {
        let actor = Actor(name: "New Actor", avatar: "https://robohash.org/406b5a0f87dd6fe4e944ed0fbc9961f2?set=set4&bgset=&size=400x400")
        actors.append(actor)
        
        tableView.beginUpdates()
        //Case we are showing EmptyStatusCell we have to reload this row
        if actors.count == 1 {
            tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .bottom)
        } else {
            tableView.insertRows(at: [IndexPath(row: actors.count - 1, section: 0)], with: .automatic)
        }
        tableView.endUpdates()
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if actors.count > 0 {
            return "main"
        }
        return nil
    }
    
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return (actors.count > 0)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteActorAtIndexPath(indexPath)
        }
    }
    
    func createActorCellForIndexPath(indexPath: IndexPath) -> ActorCell {
        let cell: ActorCell = tableView.dequeueReusableCell(withIdentifier: "ActorCell", for: indexPath) as! ActorCell
        let actor = actors[indexPath.row]
        cell.nameLabel.text = actor.name
        cell.avatarImageView.sd_setImage(with: URL(string: actor.avatarImage), placeholderImage: UIImage(named: "placeholder"), options: .cacheMemoryOnly, completed: nil)
        return cell
    }
    
    func createEmptyCellForIndexPath(indexPath: IndexPath) -> EmptyStatusCell {
        let cell: EmptyStatusCell = tableView.dequeueReusableCell(withIdentifier: "EmptyStatusCell", for: indexPath) as! EmptyStatusCell
        cell.delegate = self
        return cell
    }
    
    internal func deleteActorAtIndexPath(_ indexPath: IndexPath) {
        actors.remove(at: indexPath.row)
        tableView.beginUpdates()
        if actors.count == 0 {
            tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .top)
        } else {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        tableView.endUpdates()
    }
    
}

extension ActorsViewController: EmptyStatusCellDelegate {
    func emptyStatusCellDidPressBack(cell: EmptyStatusCell) {
        navigationController?.popViewController(animated: true)
    }
}

