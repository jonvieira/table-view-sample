//
//  ViewController.swift
//  Minhas Tarefas
//
//  Created by Desenvolvimento on 01/03/18.
//  Copyright © 2018 Jonas. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var arrayTarefas: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atualizarLista()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTarefas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = arrayTarefas[indexPath.row]
        return celula
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            let tarefaAdapter = TarefaAdapter()
            tarefaAdapter.removerTarefa(indice: indexPath.row)
            atualizarLista()
            tableView.reloadData()
        }
    }
    
    //Exibido quando a tela reaparece
    override func viewDidAppear(_ animated: Bool) {
        
        //notifica que tem mudanca
        atualizarLista()
        tableView.reloadData()
    }
    
    func atualizarLista(){
        let tarefaAdapter = TarefaAdapter()
        
        //array dos dados atuais da tabela
        arrayTarefas = tarefaAdapter.listarTarefas()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

