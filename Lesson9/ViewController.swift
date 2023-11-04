//
//  ViewController.swift
//  Lesson9
//
//  Created by Daniar on 02.11.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private var names = ["Finish to do app","Buy groceries","Conference call","Create reports","Dinner with Connie","Update cloud storage","Complete the presentation","Walk the dog","Go to the gym","Write the monthly report","Call Mom","Pay the bills","Finish the book","Plan the weekend trip","Jimmies birthday"
    ]
    private var images = ["desktopcomputer", "cart.fill", "message.fill", "dollarsign", "fork.knife", "cloud.fill", "laptopcomputer", "dog.fill", "gym.bag.fill", "newspaper.fill", "phone.fill", "bolt.horizontal.fill", "book.fill", "beach.umbrella.fill", "birthday.cake.fill"]
    private var iconColors = [".red", ".blue", ".green", ".cyan", ".yellow", ".purple", ".blue", ".brown", ".black", ".black", ".red", ".yellow", ".green", ".yellow", ".red"]
    private let names2 = ["Breakfast with director", "Screen application", "Build application", "Go to the pool", "Call Dad"]
    private let images2 = ["checkmark.circle", "checkmark.circle", "checkmark.circle", "checkmark.circle", "checkmark.circle"]
    private let names3 = ["Do the homework", "Feed the dog"]
    private let images3 = ["book.fill", "dog.fill"]
    private var sections = ["TO DO (15)", "Completed (5)", "Forgotten(2)"]
    
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private lazy var namesTableView: UITableView = {
        
        let tableView = UITableView()
        tableView.register(NameTableViewCell.self, forCellReuseIdentifier: "NameTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        view.backgroundColor = .systemBackground
        namesTableView.dataSource = self
        namesTableView.delegate = self
        
        todoTab.addTarget(self, action: #selector(changeNamesForTodo), for: .touchUpInside)
        todayTab.addTarget(self, action: #selector(changeNamesForToday), for: .touchUpInside)
        
        setupUI()
    }
    
   
//MARK: - Header View
    
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(leftIcon)
        view.addSubview(rightIcon)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        return view
      }()
    private lazy var leftIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "calendar")
        
        image.contentMode = . scaleAspectFit
        image.tintColor = .black
        
        return image
      }()
      
    private lazy var rightIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.contentMode = . scaleAspectFit
        image.tintColor = .black
        
        return image
      }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TO DO LIST"
        
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        return label
    }()
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "15 task, 5 completed"
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
//MARK: - Tabs view
    private lazy var tabsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255.0, green: 220/255.0, blue: 220/255.0, alpha: 1.0)
        view.addSubview(todayTab)
        view.addSubview(tomorrowTab)
        view.addSubview(todoTab)
        return view
    }()
   
    private lazy var todayTab: UIButton = {
        let button = UIButton()
        
        button.setTitle("Today (15)", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 13
        button.backgroundColor = .black
        return button
       
   }()
   
    private lazy var tomorrowTab: UIButton = {
        let button = UIButton()
        button.setTitle("Tomorrow", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 13
        return button
   }()
   
    private lazy var todoTab: UIButton = {
        let button = UIButton()
        
        button.setTitle("TO DO", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 13
        
        return button
       
   }()
    
    @objc func changeNamesForTodo() {
        
        names = ["Add to list item", "Sugar", "Milk", "Cheese", "Flour", "Apples", "Bread", "Butter", "Rubbish bags",
                 "Eggs", "Yogurt", "Cereal", "Bananas", "Coffee", "Orange Juice", "Pasta", "Tomatoes", "Chicken", "Broccoli", "Toilet Paper"]
        sections = [" "]
        
        images = ["square","square","square","square","square","square","square","square","square","square","square","square","square","square","square","square","square","square","square","square"]
        iconColors = [".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue", ".blue"]
        todayTab.backgroundColor = UIColor(red: 220/255.0, green: 220/255.0, blue: 220/255.0, alpha: 1.0)
        todoTab.backgroundColor = .black
        todayTab.setTitleColor(.black, for: .normal)
        todoTab.setTitleColor(.white, for: .normal)
        namesTableView.reloadData()
        
        
    }
    
    @objc func changeNamesForToday() {
        
        names = ["Finish to do app","Buy groceries","Conference call","Create reports","Dinner with Connie","Update cloud storage","Complete the presentation","Walk the dog","Go to the gym","Write the monthly report","Call Mom","Pay the bills","Finish the book","Plan the weekend trip","Jimmies birthday"
        ]
        images = ["desktopcomputer", "cart.fill", "message.fill", "dollarsign", "fork.knife", "cloud.fill", "laptopcomputer", "dog.fill", "gym.bag.fill", "newspaper.fill", "phone.fill", "bolt.horizontal.fill", "book.fill", "beach.umbrella.fill", "birthday.cake.fill"]
        iconColors = [".red", ".blue", ".green", ".cyan", ".yellow", ".purple", ".blue", ".brown", ".black", ".black", ".red", ".yellow", ".green", ".yellow", ".red"]
        sections = ["TO DO (15)", "Completed (5)", "Forgotten(2)"]
        todayTab.backgroundColor = .black
        todoTab.backgroundColor =  UIColor(red: 220/255.0, green: 220/255.0, blue: 220/255.0, alpha: 1.0)
        todayTab.setTitleColor(.white, for: .normal)
        todoTab.setTitleColor(.black, for: .normal)
        namesTableView.reloadData()
    }
   

   
}


   
//MARK: - Table view data source methods
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            names.count
        case 1:
            names2.count
        default:
            names3.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
       
        switch indexPath.section {
        case 0:
            cell.configure(name: names[indexPath.row], imageName: images[indexPath.row], color: iconColors[indexPath.row])
        case 1:
            cell.configure2(name: names2[indexPath.row], imageName: images2[indexPath.row])
        default:
            cell.configure3(name: names3[indexPath.row], imageName: images3[indexPath.row])
        }
        return cell
    }
}

//MARK: - Table view delegate methods
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        (view.window?.windowScene?.screen.bounds.height ?? 0) * 0.1
    }
}




// MARK: - UI setup methods
private extension ViewController {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(namesTableView)
        view.addSubview(headerView)
        view.addSubview(tabsView)
       
    }
    
    func setupConstraints() {
        namesTableView.snp.makeConstraints { make in
            make.top.equalTo(tabsView.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(20)

        }
       
        leftIcon.snp.makeConstraints { make in
            make.top.equalTo(headerView)
            make.leading.equalTo(headerView).offset(15)
            make.centerY.equalToSuperview()
            make.size.equalTo(view.snp.size).dividedBy(12)
           
        }
        rightIcon.snp.makeConstraints { make in
            make.top.equalTo(headerView)
            make.trailing.equalTo(headerView).offset(-15)
            make.centerY.equalToSuperview()
            make.size.equalTo(view.snp.size).dividedBy(12)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(headerView)
            make.centerY.equalTo(headerView.snp.centerY)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(headerView)
            make.top.equalTo(titleLabel.snp.bottom)
        }
        tabsView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.snp.height).dividedBy(15)
        }
        todayTab.snp.makeConstraints { make in
            make.center.equalTo(tabsView)
           
        }
        tomorrowTab.snp.makeConstraints { make in
            make.leading.equalTo(todayTab.snp.trailing).offset(50)
            make.centerY.equalTo(tabsView)
        }
        todoTab.snp.makeConstraints { make in
            make.trailing.equalTo(todayTab.snp.leading).offset(-50)
            make.centerY.equalTo(tabsView)
           
        }
              
    }
}
