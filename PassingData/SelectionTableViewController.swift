//
//  SelectionTableViewController.swift
//  PassingData
//
//  Created by Mahesh Prasad on 04/10/22.
//

import UIKit

let fruits = ["Apple", "Mango", "Banana","Orange","Strawberry","Kiwi","Grapes","Blueberries","Peach"]
let veggies = ["Carrot","Potato","Beans","Bell Pepper","Spinach","Cucumber"]

enum ListType {
    case fruit
    case veggies
}

protocol itemSelectionDelegate: class {
    func itemSelected(listType: ListType, selectedItem: String)
}


class SelectionTableViewController: UITableViewController {

    var dataSource: [String]!
    var listType:ListType = .fruit
    var selectedIndex = -1
    var selectedItem: String!
    
    var delegate: itemSelectionDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        switch listType {
        case .fruit:
            dataSource = fruits
        case .veggies:
            dataSource = veggies
        }
        
        if let selectedItem = selectedItem {
            if let index = dataSource.index(of: selectedItem) {
                selectedIndex = index
            }
        }
        
    }
    @IBAction func done(_ sender: Any) {
        
        if selectedIndex == -1 {
            self.dismiss(animated: true)
        } else {
            delegate!.itemSelected(listType: listType, selectedItem: dataSource[selectedIndex])
            self.dismiss(animated: true)
        }
        
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = dataSource[indexPath.row]
        if indexPath.row == selectedIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
