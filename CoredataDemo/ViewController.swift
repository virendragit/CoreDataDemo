//
//  ViewController.swift
//  CoredataDemo
//
//  Created by Virendra Gupta on 6/27/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // createEmployee()
         fetchEmployee()
    }
    
    func createEmployee(){
        let employee = Employee(context: PersistentStorage.shared.context)
        employee.name = "viren"
        
        PersistentStorage.shared.saveContext()
    }
    
    func fetchEmployee(){

        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
        do {
            guard let result = try  PersistentStorage.shared.context.fetch(Employee.fetchRequest()) as? [Employee] else {return}
            result.forEach({debugPrint($0.name)})
        } catch let error  {
            debugPrint(error)
        }
    }


}

