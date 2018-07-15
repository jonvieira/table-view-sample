//
//  tarefaUserDefaults.swift
//  Minhas Tarefas
//
//  Created by Desenvolvimento on 01/03/18.
//  Copyright © 2018 Jonas. All rights reserved.
//

import UIKit

class TarefaAdapter{
    
    let chaveListaTarefa = "listaTarefa"
    var arrayTarefas: [String] = []
    
    func salvarTarefa(stringTarefa : String){
        
        //recuperar, primeiro consulta se tem algo na tabela, se tiver recupera, e insere com o Append
        arrayTarefas = listarTarefas()
        
        //adicionar ao array
        arrayTarefas.append(stringTarefa)
        
        //salvando o dado no userdefaults
        UserDefaults.standard.set( arrayTarefas, forKey: chaveListaTarefa)
    }
    
    func listarTarefas() -> Array<String> {
        
        //recuperando o dado do userdefaults
        let dadosUserDefaults = UserDefaults.standard.object(forKey: chaveListaTarefa)
        
        if dadosUserDefaults != nil {
            return dadosUserDefaults as! Array
        }
        else{
            return []
        }
    }
    
    func removerTarefa(indice : Int){
        arrayTarefas = listarTarefas()
        
        arrayTarefas.remove(at: indice)
        UserDefaults.standard.set( arrayTarefas, forKey: chaveListaTarefa)
    }
    
}
