//
//  ViewController.swift
//  TableViewCustomDemo
//
//  Created by HamGuy on 13/01/2017.
//  Copyright © 2017 HamGuy. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tableView:NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: NSTableViewDataSource{
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 20
    }
}

extension ViewController: NSTableViewDelegate{
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellview = tableView.make(withIdentifier: "cell", owner: self) as? NSTableCellView
        cellview?.textField?.stringValue = "Cell Index \(row)"
        return cellview
    }
}

