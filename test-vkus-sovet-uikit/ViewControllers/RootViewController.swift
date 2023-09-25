//
//  ViewController.swift
//  test-vkus-sovet
//
//  Created by Danil Peregorodiev on 21.09.2023.
//

import UIKit

final class ViewController: UIViewController {

    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        let label = UILabel()
        label.text = "VKUSSOVET"
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        

        return view
    }()
    
    let horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .darkGray
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10

        let cellWidth = (UIScreen.main.bounds.width - 40) / 3 //  интервал между ячейками
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth) // высота ячейки

        layout.scrollDirection = .horizontal // горизонтальный скролл

        return collectionView
    }()
    
    let verticalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        let cellWidth = (UIScreen.main.bounds.width - 30) / 2
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth) // высота
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        // все созданные представления на экран
        view.addSubview(headerView)
        view.addSubview(horizontalCollectionView)
//        view.addSubview(verticalHeaderView)
        view.addSubview(verticalCollectionView)
        
        // ограничения для размещения представлений
        setupConstraints()
        
        // делегат и источник данных для UICollectionView
        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
        verticalCollectionView.dataSource = self
        
        // регистрация ячеек коллекции
        horizontalCollectionView.register(GrayRoundedCell.self, forCellWithReuseIdentifier: "GrayRoundedCellIdentifier")
        verticalCollectionView.register(GrayRoundedCell.self, forCellWithReuseIdentifier: "GrayRoundedCellIdentifier")
    }
}

private extension ViewController {
    func setupViews() {
        view.backgroundColor = .darkGray
        
        view.addSubview(headerView)
        view.addSubview(horizontalCollectionView)
        view.addSubview(verticalCollectionView)
    }
    
    // Метод для настройки ограничений размещения представлений
    func setupConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false //
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false //
        NSLayoutConstraint.activate([
            horizontalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10), // Отступ под заголовком
            horizontalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horizontalCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        verticalCollectionView.translatesAutoresizingMaskIntoConstraints = false //
        NSLayoutConstraint.activate([
        verticalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        verticalCollectionView.topAnchor.constraint(equalTo: horizontalCollectionView.bottomAnchor, constant:10), // Отступ между UICollectionView
        verticalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        verticalCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// Расширение для реализации делегата и источника данных UICollectionView
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // заменить на реальное число элементов
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == horizontalCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GrayRoundedCellIdentifier", for: indexPath) as! GrayRoundedCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GrayRoundedCellIdentifier", for: indexPath) as! GrayRoundedCell
            return cell
        }
    }
}

