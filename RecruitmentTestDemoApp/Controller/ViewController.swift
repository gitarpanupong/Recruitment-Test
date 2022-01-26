//
//  ViewController.swift
//  RecruitmentTestDemoApp
//
//  Created by Panupong Chaiyarut on 19/1/2565 BE.
//

import UIKit
import ObjectMapper
import SwiftDate

class ViewController: UIViewController {
    
    var getFunModel = [Datum]()
    
    internal var homeView: HomeView = {
        let view = HomeView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        navigationItem.title = "RecruitmentTest"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        homeView.delegate = self
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        homeView.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HOMECELL")
        setComponent()
        fetch("1D")
    }
    
    func fetch(_ type: String) {
        HomeService.sharedInstance.getFun(type, parameter: [:]) { [weak self] data in
            guard let data = data else{
                return
            }
            
            self?.getFunModel = data.data?.sorted(by: { $0.avgReturn! > $1.avgReturn! } ) ?? []
            self?.homeView.tableView.reloadData()
            self?.homeView.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }

    func setComponent(){
        view.addSubview(homeView)
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        
        ])
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getFunModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HOMECELL", for: indexPath) as! HomeTableViewCell
        cell.firstStack.headerLabel.text = "(nav) \(getFunModel[indexPath.row].nav ?? 0)"
        cell.firstStack.titleLabel.text = getFunModel[indexPath.row].thailandFundCode
        cell.firstStack.dateLabel.text = getFunModel[indexPath.row].navDate?.toDate()?.date.toFormat("dd MMM yyyy")
        
        cell.secondStack.headerLabel.textColor = getFunModel[indexPath.row].avgReturn! > 0.0 ? .systemGreen : .systemRed
        cell.secondStack.headerLabel.text = "\(getFunModel[indexPath.row].avgReturn ?? 0)"
        cell.secondStack.titleLabel.text = "\(getFunModel[indexPath.row].navReturn ?? 0)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

extension ViewController: HomeViewProtocol {
    func didSelect(button: UIButton) {
        fetch(button.titleLabel?.text ?? "")
    }
    
    
}
