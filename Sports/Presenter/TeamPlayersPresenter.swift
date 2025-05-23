//
//  LeaguesPresenter.swift
//  Sports
//
//  Created by Macos on 13/05/2025.
//

import Foundation
class TeamPlayersPresenter{
   weak var myTable : TeamDetailsViewController!
    
    func attachTableView(tableView: TeamDetailsViewController){
        myTable = tableView
    }
    func getDataFromModel(sportType: String, teamName : String) {
        NetworkService.fetchPlayers(sportType: sportType, teamName: teamName) { [weak self] res in
            DispatchQueue.main.async {
                print("result = \(res)")
                guard let players = res else {
                    print("No leagues found for \(sportType)")
                    self?.myTable.activityIndicator.stopAnimating()
                    self?.myTable.showFetchErrorAlert()
                    return
                }
                print("players\(players)")
                self?.myTable.renderToView(result: players)
            }
        }
    }
}
