//
//  weatherViewController.swift
//  Parsing lab
//
//  Created by Kary Martinez on 8/27/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import UIKit

class weatherViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    var weather = [listWrapper]() {
        didSet {
            weatherTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentWeather = weather[indexPath.row]
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "weatherCell")
        cell?.textLabel?.text = currentWeather.name
        return cell!
    }
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configureTableView()

        // Do any additional setup after loading the view.
    }
    
    private func configureTableView() {
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
    }
    private func loadData () {
        guard let pathToData = Bundle.main.path(forResource: "weather", ofType: "json") else {
            fatalError("colors.json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            let weatherFromJSON = try listWrapper.getWeather(from: data)
            weather = weatherFromJSON
        }
        catch {
            fatalError("An error occurred: \(error)")
        }
        
    }

}
