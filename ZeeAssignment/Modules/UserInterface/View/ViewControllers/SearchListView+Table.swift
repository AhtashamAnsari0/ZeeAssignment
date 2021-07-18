//
//  SearchListView+Table.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 15/07/21.
//

import UIKit

//MARK: - UITableView DataSource Mathod
extension ImagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getSearchList().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:Constants.CellIdentifiers.searchCell, for: indexPath) as? SearchCell else {return  UITableViewCell()}
        let searchQuery = presenter?.getSearchQuery(with: indexPath.row)
        cell.labelSearchText?.text = searchQuery?.query
        return cell
    }
}

//MARK: - UITableView Delegate Mathod
extension ImagesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchQuery = presenter?.getSearchQuery(with: indexPath.row)
        loadSearchQuery(with: searchQuery?.query ?? "")
        searchBar.text = searchQuery?.query ?? ""
    }
}
