//
//  SaveService.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import Foundation


class SaveToUserDefaultService<Model: Codable> {
    
    func save(models: [Model]) {
        let key = String(describing: Model.self)
        do {
            let json = try JSONEncoder().encode(models)
            UserDefaults.standard.set(json, forKey: key)
        } catch {
            print(error.localizedDescription) // TODO: handle error
        }
    }
    
    func restore() -> [Model] {
        let key = String(describing: Model.self)
        do {
            guard let data = UserDefaults.standard.data(forKey: key) else {return []}
            let model = try JSONDecoder().decode([Model].self, from: data)
            return model
        } catch {
            print(error.localizedDescription) // TODO: handle error
            return []
        }
    }
    
    func save(model: Model, key: String) {
        do {
            let json = try JSONEncoder().encode(model)
            UserDefaults.standard.set(json, forKey: key)
        } catch {
            print(error.localizedDescription) // TODO: handle error
        }
    }
    
    func restore(key: String) -> Model? {
        do {
            guard let data = UserDefaults.standard.data(forKey: key) else {return nil}
            let model = try JSONDecoder().decode(Model.self, from: data)
            return model
        } catch {
            print(error.localizedDescription) // TODO: handle error
            return nil
        }
    }
    
}
