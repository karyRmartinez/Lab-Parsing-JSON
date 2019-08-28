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
    
    var colors = [colorWrapper]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentColor = colors[indexPath.row]
        
        let redValue = CGFloat(currentColor.rgb.fraction.r)
        let greenValue = CGFloat(currentColor.rgb.fraction.g)
        let blueValue = CGFloat(currentColor.rgb.fraction.b)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell")
        cell?.textLabel?.text = currentColor.name.value
        cell?.backgroundColor = UIColor(displayP3Red: redValue, green: greenValue, blue: blueValue, alpha: 1)
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
        guard let pathToData = Bundle.main.path(forResource: "color", ofType: "json") else {
            fatalError("colors.json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            let colorsFromJSON = try colorWrapper.getcolors(from: data)
            colors = colorsFromJSON
        }
        catch {
            fatalError("An error occurred: \(error)")
        }
        
    }
    
}


