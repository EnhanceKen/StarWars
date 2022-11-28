//
//  ViewController.swift
//  StarWarsExam
//
//  Created by Consultant on 11/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var starWarsTableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.dataSource = self
//        table.delegate = self
//        table.prefetchDataSource = self
        table.register(StarwarsTableViewCell.self, forCellReuseIdentifier: "StarCell")
        
        
    
    return table
    
    }()
    
    
    
    var tableView: UITableView?
    let network: NetworkURLSessionManager
//    let Currenturl = URL(string: "https://swapi.dev/api/people/")
    var pages: [Person] = []
    var currentPage : PageResult?


    
    
    init(network: NetworkURLSessionManager = NetworkURLSessionManager()) {
        self.network = network
        super.init(nibName: nil, bundle: nil)
//        self.setUpUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        
    }
    
    private func setUpUI() {
       
        self.view.addSubview(self.starWarsTableView)
        
        starWarsTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        starWarsTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        starWarsTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        starWarsTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        
    }
    //MARK : RequestNextPage + Fetch Poke
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StarCell", for: indexPath) as? StarwarsTableViewCell else {
            print("failed when creating cell for indexPath \(indexPath)")
            return UITableViewCell()


        }
        let temp = self.pages[indexPath.row]
        cell.characterNamelabel.text = temp.name
        cell.eyecolorLabel.text = temp.eyeColor
        cell.hairColorlabel.text = temp.hairColor
        
//        self.network.fetchCharactersResult(with: temp.homeworld) { (home : Result<Planets, NetworkError>) in
//            switch home{
//            case.success(let h):
//                DispatchQueue.main.asynch {
//                    cell.homeworldlabel.text = h.name
//                }
//            case .failure(let err):
//                print(err)
//            }
//        }
        return cell
    }
    

}
