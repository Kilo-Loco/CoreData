//
//  ViewController.swift
//  Saving Data BayBeh
//
//  Created by Kyle Lee on 7/2/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            let people = try PersistenceServce.context.fetch(fetchRequest)
            self.people = people
            self.tableView.reloadData()
        } catch {}
        
    }
    
    @IBAction func onPlusTapped() {
        
        let alert = UIAlertController(title: "Adicionar Remédio", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Início"
            
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Medicamento"
            textField.keyboardType = .numberPad
            
            
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Período da Aplicação"
            textField.keyboardType = .numberPad
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Modo da Aplicação"
            textField.keyboardType = .numberPad
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Frequencia"
            textField.keyboardType = .numberPad
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Propósito"
            textField.keyboardType = .numberPad
        }
        
        let action = UIAlertAction(title: "Gravar", style: .default) { (_) in
            
            
            let inicio = alert.textFields![0].text!
            let medicamento = alert.textFields![1].text!
            let periododaplicacao = alert.textFields![2].text!
            let mododaaplicacao = alert.textFields![3].text!
            let frequencia = alert.textFields![4].text!
            let proposito = alert.textFields![5].text!
            
            let person = Person(context: PersistenceServce.context)
            person.inicio = inicio
            person.medicamento = medicamento
            person.periododaaplicacao = periododaplicacao
            person.mododaaplicacao = mododaaplicacao
            person.frequencia = frequencia
            person.proposito = proposito
            
            PersistenceServce.saveContext()
            self.people.append(person)
            self.tableView.reloadData()
        }
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = people[indexPath.row].inicio!
        cell.detailTextLabel?.text = String(people[indexPath.row].medicamento!)
       // cell.detailTextLabel?.text = String(people[indexPath.row].periododaaplicacao!)
        cell.detailTextLabel?.text = String(people[indexPath.row].mododaaplicacao!)
        cell.detailTextLabel?.text = String(people[indexPath.row].frequencia!)
        cell.detailTextLabel?.text = String(people[indexPath.row].proposito!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            PersistenceServce.context.delete(people[indexPath.row])
            people.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            PersistenceServce.saveContext()
            
        }
    }
            
        }
        
        
   


