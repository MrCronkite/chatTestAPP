//
//  ChatsViewController.swift
//  chatTesrApp
//
//  Created by admin1 on 24.03.23.
//

import UIKit

final class ChatsViewController: UIViewController {
    
    var contats = Source.makeContactsWithGroup()
    
    let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        tableView.register(ChatCell.self, forCellReuseIdentifier: "ChatCell")
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
        
        tableView.estimatedRowHeight = 50
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = Resouces.Colors.btnColor
        tableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ChatsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
            2
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            contats[section].count
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            switch section {
            case 0: return "Business"
            case 1: return "Other"
            default: return nil
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as? ChatCell else { fatalError() }
            
            cell.config(contact: contats[indexPath.section][indexPath.row])
            
            return cell
            
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            contats[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        
        func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            let contact = contats[sourceIndexPath.section].remove(at: sourceIndexPath.row)
            contats[destinationIndexPath.section].insert(contact, at: destinationIndexPath.row)
        }}

extension ChatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(MainChatViewController(), animated: true)
    }
}

extension ChatsViewController {
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
