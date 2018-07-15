//
//  TarefaViewController.swift
//  Minhas Tarefas
//
//  Created by Desenvolvimento on 01/03/18.
//  Copyright © 2018 Jonas. All rights reserved.
//

import UIKit

class TarefaViewController: UIViewController {
    
    @IBOutlet weak var tarefaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func adicionarTarefa(_ sender: Any) {
        
        if let tarefa = tarefaTextField.text{
            if tarefa != ""{
                let tarefaAdapter = TarefaAdapter()
                tarefaAdapter.salvarTarefa(stringTarefa : tarefa)
                
                let alertController = UIAlertController(title: "Prontinho!", message: "Tarefa inserida :)", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
                tarefaTextField.text = ""
            }
            else{
                let alertController = UIAlertController(title: "Ops!", message: "Insira alguma tarefa primeiro :(", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
           
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
