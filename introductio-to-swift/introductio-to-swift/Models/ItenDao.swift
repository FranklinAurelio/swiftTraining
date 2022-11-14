//
//  ItenDao.swift
//  introductio-to-swift
//
//  Created by Franklin Carvalho on 14/11/22.
//

import Foundation

class ItemDao {
    func save (_ itens:[Item]){
        do{
            let data  = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let path  = GetDirItem() else{ return }
            try data.write(to: path)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func get() -> [Item]{
        guard let dir = GetDirItem() else { return[] }
        do{
            let data = try Data(contentsOf: dir)
            guard let savedItens = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Item> else { return[] }

            return savedItens
        }catch{
            print (error.localizedDescription)
            return []
        }
        
    }
    
    //MARK: Shared Methods
    
    func GetDirItem() -> URL?{
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else{ return nil}
        
        let path = dir.appendingPathExtension("ItensApplication")
        
        return path
    }
    
    
}


