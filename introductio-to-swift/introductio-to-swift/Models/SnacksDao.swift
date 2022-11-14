//
//  SnacksDao.swift
//  introductio-to-swift
//
//  Created by Franklin Carvalho on 14/11/22.
//

import Foundation
import UIKit

class SnacksDao {
    func save(_ snacks: [Snack]){
        guard let path = getPath() else{ return }
        
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: snacks, requiringSecureCoding: false)
            try data.write(to: path)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func get() -> [Snack]{
        guard let path = getPath() else{ return [] }
        
        do{
            let data = try Data(contentsOf: path)
            guard let SavedSnacks = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Snack> else { return [] }
            return SavedSnacks
            
        }
        catch{
            return []
        }
    }
    
    //MARK: Shared Methods
    
    func getPath() -> URL? {
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else{ return nil }
        
        let path = dir.appendingPathExtension("SnacksApplication")
        return path
    }
    
    
    
}
