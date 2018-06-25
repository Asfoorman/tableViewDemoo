//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Anes Mehai  on 6/25/18.
//  Copyright © 2018 Anes Mehai . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    struct Animals
    {
        var name: String
        var image: UIImage
    }
    
    var AnimalsList: [Animals] = [Animals(name: "Horse", image: #imageLiteral(resourceName: "horse")), Animals(name: "Cow", image: #imageLiteral(resourceName: "cow")),
                                  Animals(name: "Camel", image: #imageLiteral(resourceName: "camel")), Animals(name: "Sheep", image: #imageLiteral(resourceName: "sheep")), Animals(name: "Goat", image: #imageLiteral(resourceName: "ronaldo"))]
    
    
    let cellReuseIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func doAddAnimal(_ sender: Any) {
        let alertController = UIAlertController(title: "New Animal",
                                                message: "Please add your new animal below:",
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField(configurationHandler: {(nameField) in
            nameField.text=""
            nameField.placeholder="Animal Name:"
            nameField.isSecureTextEntry=false
        })
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alertController](_) in
            let nameField = alertController?.textFields![0]
            let name = nameField?.text
            self.AnimalsList.append(Animals(name: name!,image: #imageLiteral(resourceName: "mystery") ))
            self.tableView.reloadData()
        }))
        
        present(alertController, animated: true, completion: nil)
    }
    /*
     
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.AnimalsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier:cellReuseIdentifier) as UITableViewCell!
        
        cell.textLabel?.text = self.AnimalsList[indexPath.row].name
        cell.imageView?.image = self.AnimalsList[indexPath.row].image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell numer \(indexPath.row).")
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            AnimalsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }   else if editingStyle == .insert {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

