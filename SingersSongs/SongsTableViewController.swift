//
//  SongsTableViewController.swift
//  SingersSongs
//
//  Created by Dmitry Dmitry on 02.07.2023.
//

import UIKit

class SongsTableViewController: UITableViewController {
    
    var songs: [Song] = []
    var index: Int
    var singer: Singer?
    
    let singersVC = SingersTableViewController()
    private let cellID = "songCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        setupNavigationBar()

        if let singer = singer {
            songs = DataManager.shared.fetchSongs(singer: singer)
        }
        tableView.reloadData()
    }
    
    init(index: Int) {
        self.index = index
        singer = singersVC.singers[index]
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let songs = songs[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = songs.title
        content.secondaryText = songs.releaseDate
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let authorSongVC = AuthorOfTheSongTableViewController(index: indexPath.row)
//        navigationController?.pushViewController(authorSongVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func setupNavigationBar() {
        title = singersVC.singers[index].name
        
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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(goBack(_ :))
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addSong)
        )
    }
    
    @objc func goBack(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addSong(_ sender: UIBarButtonItem) {
        var titleTextField = UITextField()
        var releaseDateTextField = UITextField()
        
        let alert = UIAlertController(
            title: "Enter new song",
            message: "",
            preferredStyle: .alert
        )
        
        let createAction = UIAlertAction(
            title: "Create",
            style: .default
        ) { [self] action in
            let song = DataManager.shared.createSong(
                title: titleTextField.text ?? "",
                realeseData: releaseDateTextField.text ?? "",
                singer: singer!)
            songs.append(song)
            tableView.reloadData()
            DataManager.shared.saveContext()
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Ex: Formation"
            titleTextField = alertTextField
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Ex: February 6, 2016"
            releaseDateTextField = alertTextField
        }
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .destructive
        ) { action in
            self.dismiss(
                animated: true,
                completion: nil
            )
        }
        
        alert.addAction(createAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

}
