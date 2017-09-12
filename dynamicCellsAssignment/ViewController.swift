//
//  ViewController.swift
//  dynamicCellsAssignment
//
//  Created by Andrew Lau on 9/11/17.
//  Copyright © 2017 Andrew Lau. All rights reserved.
//

import UIKit

var tasks: [String] = ["-----To-Do List 3000-----"]

class ViewController: UIViewController {


    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        if let message = self.taskTextField.text{
            if message.characters.count > 0{
                tasks.append(message)
            }
        }
        self.taskTextField.text = "" //empty text field after enter
        tableView.reloadData()
        print (taskTextField.text!)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//What data do i want to display?
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}
//Delete tasks/cell
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }
}









