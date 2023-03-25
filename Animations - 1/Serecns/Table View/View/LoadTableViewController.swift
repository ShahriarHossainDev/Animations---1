//
//  LoadTableViewController.swift
//  Animations - 1
//
//  Created by Shishir_Mac on 25/3/23.
//

import UIKit

class LoadTableViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var refControl = UIRefreshControl()
    
    var itemsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            appearance.backgroundColor = UIColor(named: "primaryColor")
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
        refControl.tintColor = UIColor.white
        refControl.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: UIControl.Event.valueChanged)
        tableView.addSubview(refControl)
        
        loadData()
    }
    
    func loadData() {
        for i in 0 ... 40 {
            itemsArray.append("Item \(40 - i)")
        }
        self.tableView.reloadData()
    }

    @objc func handleRefresh(refreshControl: UIRefreshControl) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) { // We add a 1-second delay for the pull to refresh animation because the UI will glitch otherwise and won't look nice
            
            // Refresh the data here
            let start = self.itemsArray.count
            let end = self.itemsArray.count + 20
            for i in start ..< end {
                self.itemsArray.insert("Item \(i)", at: 0)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
                refreshControl.endRefreshing()
            }
        }
    }


}

extension LoadTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcellid", for: indexPath)
        cell.textLabel?.text = itemsArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
