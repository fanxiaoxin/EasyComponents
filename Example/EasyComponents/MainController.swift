//
//  ViewController.swift
//  EasyComponents
//
//  Created by fanxx on 02/10/2021.
//  Copyright (c) 2021 fanxx. All rights reserved.
//

import UIKit
//import EasyCoding
//import Kingfisher
import EasyComponents

class MainController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.easy.style(.cell(UITableViewCell.self))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: .easyCellIdentifier)!
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "事件"
        default: break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let c = EventController()
            c.easy.event.register(event: .dealloc) {
                print("EventController dealloc")
            }
            c.easy.event.register(event: .viewDidLoad(.before)) {
                print("EventController before viewDidLoad")
            }
            c.easy.event.register(event: .viewDidLoad(.after)) {
                print("EventController after viewDidLoad")
            }
            c.easy.event.register(event: .didAppear) {
                print("EventController after didAppear")
            }
            self.navigationController?.pushViewController(c, animated: true)
        default: break
        }
    }

}
