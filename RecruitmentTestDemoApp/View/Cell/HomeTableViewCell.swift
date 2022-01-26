//
//  HomeTableViewCell.swift
//  RecruitmentTestDemoApp
//
//  Created by Panupong Chaiyarut on 19/1/2565 BE.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    internal var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal var firstStack: FirstStack = {
        let st = FirstStack()
        st.titleLabel.textColor = .systemBlue
        return st
    }()
    
    internal var secondStack: FirstStack = {
        let st = FirstStack()
        st.titleLabel.textAlignment = .right
        st.headerLabel.textAlignment = .right
        st.dateLabel.isHidden = true
        return st
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setComponent(){
        
        contentView.addSubview(firstStack)
        contentView.addSubview(secondStack)
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            firstStack.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16),
            firstStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            firstStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -16),
            
            secondStack.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16),
            secondStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            secondStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -32),
        ])
    }

}

class FirstStack: UIStackView {
    
    internal var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .fillEqually
        spacing = 5
        setComponent()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setComponent(){
        addArrangedSubview(headerLabel)
        addArrangedSubview(titleLabel)
        addArrangedSubview(dateLabel)
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}
