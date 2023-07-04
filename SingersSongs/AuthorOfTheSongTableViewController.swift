//
//  AuthorOfTheSongTableViewController.swift
//  SingersSongs
//
//  Created by Dmitry Dmitry on 03.07.2023.
//

//import UIKit
//
//class AuthorOfTheSongTableViewController: UITableViewController {
//    
//    var singers: [Singer] = []
//    var index: Int
//    var song: Song?
////    let songs = DataManager.shared.fetchSongs2()
//    private let cellID = "songAuthorCell"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
//        setupNavigationBar()
//        
//        if let song = song {
//            singers = DataManager.shared.fetchSingers2(song: song)
//        }
//        tableView.reloadData()
//
//    }
//    
//    init(index: Int) {
//        self.index = index
////        song = songs[index]
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Table view data source
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        singers.count
//    }
//
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
//        let singer = singers[indexPath.row]
//        var content = cell.defaultContentConfiguration()
//        content.text = singer.name
//        cell.contentConfiguration = content
//        return cell
//    }
//    
//
//    private func setupNavigationBar() {
////        let song = songsVC.songs[index].title
////        title = "Author of the \(song) song"
//        title = "Песня"
//        
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithOpaqueBackground()
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarAppearance.backgroundColor = UIColor(
//            red: 183/255,
//            green: 65/255,
//            blue: 14/255,
//            alpha: 1
//        )
//        navigationController?.navigationBar.standardAppearance = navBarAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//    }
//}
