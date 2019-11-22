//
//  SpellsController.swift
//  Spellbook
//
//  Created by Aaron Shackelford on 11/21/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import Foundation

class SpellsController {
    
    static func fetchSpells(completion: @escaping (Result<[Spell], SpellError>) -> Void) {
        
        guard let baseURL = URL(string: "http://www.dnd5eapi.co/api/") else { return }
        let spellsComp = baseURL.appendingPathComponent("spells")
        guard let components = URLComponents(url: spellsComp, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidURL))
            return
        }
        guard let finalURL = components.url else {
            completion(.failure(.invalidURL))
            return
        } //placeholder to test array
        //is not printing; no data being fetched
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("ERROR in \(#function) : \(error), \n---\n \(error.localizedDescription)")
                completion(.failure(.invalidURL)); return
            }
            guard let data = data else { completion(.failure(.noData)); return }
            
            do {
                let jsonDecoder = JSONDecoder()
                let topLevel = try jsonDecoder.decode(TopLevelDictionary.self, from: data)
                
                //var spells = (.results)
                var spells: [Spell] = []
                
                //TODO; may not be correctly pulling the individual numbers and adding into the array
                for dict in topLevel.results {
                    //need to be able to add each listed spell into the spells array
                    let spell = dict
                    spells.append(spell)
                }
                completion(.success(spells))
            } catch {
                print("ERROR in \(#function) : \(error), \n---\n \(error.localizedDescription)")
                completion(.failure(.noSpells)); return
            }
        }.resume()
    }
    
    enum SpellError: LocalizedError {
        case invalidURL
        case noData
        case noSpells
    }
}
