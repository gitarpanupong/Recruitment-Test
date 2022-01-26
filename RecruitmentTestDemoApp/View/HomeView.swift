//
//  HomeView.swift
//  RecruitmentTestDemoApp
//
//  Created by Panupong Chaiyarut on 19/1/2565 BE.
//

import UIKit

protocol HomeViewProtocol {
    func didSelect(button: UIButton)
}

class HomeView: UIView {
    
    internal var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.layer.borderColor = UIColor.systemBlue.cgColor
        stack.layer.borderWidth = 2
        stack.layer.cornerRadius = 25
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    internal var daysButton: UIButton = {
        let button = UIButton()
        button.setTitle("1D", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.borderWidth =  2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 25
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        button.backgroundColor = .lightGray
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didSelect(button:)), for: .touchUpInside)
        return button
    }()
    
    internal var weekButton: UIButton = {
        let button = UIButton()
        button.setTitle("1W", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didSelect(button:)), for: .touchUpInside)
        return button
    }()
    
    internal var monthButton: UIButton = {
        let button = UIButton()
        button.setTitle("1M", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.borderWidth =  2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didSelect(button:)), for: .touchUpInside)
        return button
    }()
    
    internal var yearsButton: UIButton = {
        let button = UIButton()
        button.setTitle("1Y", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 25
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didSelect(button:)), for: .touchUpInside)
        return button
    }()
    
    internal var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        setComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setComponent(){
        addSubview(stack)
        addSubview(tableView)
        
        stack.addArrangedSubview(daysButton)
        stack.addArrangedSubview(weekButton)
        stack.addArrangedSubview(monthButton)
        stack.addArrangedSubview(yearsButton)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            stack.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: stack.bottomAnchor,constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    var delegate: HomeViewProtocol?
    
    @objc func didSelect(button: UIButton){
        _ = stack.arrangedSubviews.compactMap { $0.backgroundColor = $0 == button ? .lightGray : .white }
        delegate?.didSelect(button: button)
    }
    
}
