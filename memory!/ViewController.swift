//
//  ViewController.swift
//  memory!
//
//  Created by Dhruv Mishra on 10/02/17.
//  Copyright © 2017 dhruvinity. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView! // step 17
    var memories : [Memory] = [] // step 18
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self //step 22
        tableView.delegate = self   // step 23
     
    }
    //step 24
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memories.count
    }
    // step 25
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let memory = memories[indexPath.row] // step 26
        cell.textLabel?.text = memory.title   //step 27
        cell.imageView?.image = UIImage(data: memory.image as! Data) // step 29 (28 is in ADDINGViewController)
        return cell
        
    }
    // below function is step 31
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memory = memories[indexPath.row] //step 32 step 33 involves naming our segue in main.storyboard
        performSegue(withIdentifier: "MemorySegue", sender: memory)// step 34
        
    }// below is step 35
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! ADDINGViewController // step 36
        nextVC.memory = sender as? Memory // step 37 step 38 in ADDINGViewcontroller
    }
//  step 19 involves creating a function view will appear .. it is a function that is called everytime viewcontroller is called
    override func viewWillAppear(_ animated: Bool) {
        // step 20
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // step 21
        do{
            memories = try context.fetch(Memory.fetchRequest())
            tableView.reloadData()
        }
        catch{
            
        }
        
    }


}

