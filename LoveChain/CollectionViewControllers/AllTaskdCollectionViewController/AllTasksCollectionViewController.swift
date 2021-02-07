//
//  AllTasksCollectionViewController.swift
//  LoveChain
//
//  Created by Ildar on 2/7/21.
//

import UIKit
import SideMenu

class AllTasksCollectionViewController: UIViewController {

    private var menu: SideMenuNavigationController?
    private var safeArea: UILayoutGuide!
    private let cellIdentifier = String(describing: CollectionViewCell.self)
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib(nibName: String(describing: CollectionViewCell.self), bundle: nil ), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    var tasks: [ModelTask] = [ModelTask(time: "5 февраля 14:30", title: "Пожертвование в размере 1000 рублей", status: "Ожидает верификации",type: .processRealiation),ModelTask(time: "5 февраля 14:50", title: "Пожертвование в размере 700 рублей", status: "Ожидает верификации",type: .processRealiation),ModelTask(time: "5 февраля 15:30", title: "Пожертвование в размере 1000 рублей", status: "Ожидает верификации",type: .processRealiation)]
    
    @IBOutlet weak var labelTasks: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        title = "Все заявки"
        view.backgroundColor = .tertiarySystemGroupedBackground
        self.navigationController?.isNavigationBarHidden = false
        createButtonForNavigationController()
        createMenuForNavigationController()

        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .tertiarySystemGroupedBackground
        collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 15).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    func createButtonForNavigationController() {
        let button = UIBarButtonItem(image: UIImage(named: "menu4"), style: .plain, target: self, action: #selector(didTapMenu))
        button.tintColor = .black
        navigationItem.leftBarButtonItem = button
    }
    @objc func didTapMenu() {
        if let menu = menu {
            present(menu, animated: true)
        }
    }
    func createMenuForNavigationController() {
        let menuVC = MenuViewController()
        menuVC.delegate = self
        menu = SideMenuNavigationController(rootViewController: menuVC)
        menu?.leftSide = true
        menu?.enableSwipeToDismissGesture = false
        
    }
    
    static func storyboardInstance() -> AllTasksCollectionViewController? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? AllTasksCollectionViewController
    }

}

// MARK: - UICollectionViewDataSource
extension AllTasksCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CollectionViewCell ?? CollectionViewCell()

            
        cell.configure(model: tasks[indexPath.row])

        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension AllTasksCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 50
        let collectionViewSize = collectionView.frame.size.width - padding

        return CGSize(width: collectionViewSize / 2, height: collectionViewSize / 2)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 20
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}

extension AllTasksCollectionViewController: CloseMenu {
    func showAllTasks() {
        self.menu?.dismiss(animated: true, completion: nil)
    }

    func close() {
        
        self.menu?.dismiss(animated: true, completion: nil)
        if let cabinetVC = CollectionViewController.storyboardInstance() {
            self.navigationController?.pushViewController(cabinetVC, animated: true)
        }
    }
}
