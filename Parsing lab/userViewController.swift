//
//  userViewController.swift
//  Parsing lab
//
//  Created by Kary Martinez on 8/29/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import UIKit

class userViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var userTableView: UITableView!
    
    
    
    var user = [ResultsWrapper]() {
        
        didSet {
            userTableView.reloadData()
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentUser = user[indexPath.row]
        let cell = userTableView.dequeueReusableCell(withIdentifier: "userCell")
        cell?.textLabel?.text = currentUser.name.first
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configureTableView()
        

        // Do any additional setup after loading the view.
    }
    
    private func configureTableView() {
        userTableView.delegate = self
        userTableView.dataSource = self
    }
    private func loadData () {
        guard let pathToData = Bundle.main.path(forResource: "user", ofType: "json") else {
            fatalError("user.json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            let userFromJSON = try ResultsWrapper.getUser(from: data)
            user = userFromJSON
        }
        catch {
            fatalError("An error occurred: \(error)")
        }
        
    }
   

}
