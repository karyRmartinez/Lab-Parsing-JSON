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
    
    let colors = [colorsOutput]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


