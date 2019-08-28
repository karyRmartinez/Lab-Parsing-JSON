//
//  ViewController.swift
//  Parsing lab
//
//  Created by Kary Martinez on 8/27/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var colors = [colorsOutput]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell")
        cell?.textLabel?.text = colors[indexPath.row].mode
        cell?.detailTextLabel?.text = "colors\(colors[indexPath.row].colors)"
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadData()
        // Do any additional setup after loading the view.
    }
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func loadData () {
        guard let pathToData = Bundle.main.path(forResource: "colors", ofType: "json") else {
            fatalError("colors.json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            let colorsFromJSON = try colorsOutput.getcolors(from: data)
            colors = colorsFromJSON
        }
        catch {
            fatalError("An error occurred: \(error)")
        }
        
    }
    
}


