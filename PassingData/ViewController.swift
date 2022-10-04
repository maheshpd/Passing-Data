//
//  ViewController.swift
//  PassingData
//
//  Created by Mahesh Prasad on 04/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chooseFruitButton: UIButton!
    
    @IBOutlet weak var chooseVeggieButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navController = segue.destination as! UINavigationController
        let destController = navController.topViewController as! SelectionTableViewController
        
        if segue.identifier == "FruitSegue" {
            destController.listType = .fruit
            destController.selectedItem = chooseFruitButton.titleLabel?.text
        }
        
        if segue.identifier == "VeggieSegue" {
            destController.listType = .veggies
            destController.selectedItem = chooseVeggieButton.titleLabel?.text
        }
        
        destController.delegate = self
        
    }
    
}


extension ViewController: itemSelectionDelegate {
    func itemSelected(listType: ListType, selectedItem: String) {
        if listType == .fruit {
            chooseFruitButton.setTitle(selectedItem, for: .normal)
        }
        
        if listType == .veggies {
            chooseVeggieButton.setTitle(selectedItem, for: .normal)
        }
    }
    
    
}

