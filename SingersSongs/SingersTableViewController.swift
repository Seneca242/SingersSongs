//
//  SingersTableViewController.swift
//  SingersSongs
//
//  Created by Dmitry Dmitry on 27.06.2023.
//

import UIKit

class SingersTableViewController: UITableViewController {
    
    var singers = DataManager.shared.fetchSingers()
    
    private let cellID = "singerCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        singers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let singer = singers[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = singer.name
        cell.accessoryType = .disclosureIndicator
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let songVC = SongsTableViewController(index: indexPath.row)
        navigationController?.pushViewController(songVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func setupNavigationBar() {
        title = "Singers"
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(
            red: 183/255,
            green: 65/255,
            blue: 14/255,
            alpha: 1
        )
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addSinger)
        )
    }
    
    @objc private func addSinger(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(
            title: "Enter new singer",
            message: "",
            preferredStyle: .alert
        )
        
        let createAction = UIAlertAction(
            title: "Create",
            style: .default) { action in
                let singer = DataManager.shared.createSinger(name: textField.text ?? "")
                self.singers.append(singer)
                DataManager.shared.saveContext()
                self.tableView.reloadData()
            }
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .destructive) { action in
                self.dismiss(animated: true)
            }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Example: Beyonce"
            textField = alertTextField
        }
        
        alert.addAction(createAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }

    
}
