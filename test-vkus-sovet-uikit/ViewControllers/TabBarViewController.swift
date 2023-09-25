//
//  TabBarViewController.swift
//  test-vkus-sovet-uikit
//
//  Created by Danil Peregorodiev on 25.09.2023.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создайте контроллеры для каждой вкладки
        let listViewController = ViewController()
        let cartViewController = CartViewController()
        let infoViewController = InfoViewController()
        
        // Установите контроллеры во вкладки таббара
        viewControllers = [listViewController, cartViewController, infoViewController]
        
        // Создайте настраиваемые изображения для иконок вкладок (замените на ваши изображения)
        let listImage = UIImage(named: "list_icon")?.withRenderingMode(.alwaysOriginal)
        let cartImage = UIImage(named: "cart_icon")?.withRenderingMode(.alwaysOriginal)
        let infoImage = UIImage(named: "info_icon")?.withRenderingMode(.alwaysOriginal)
        
        // Настройте цвета для выбранных и не выбранных вкладок
        tabBar.tintColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0) // Цвет выбранной вкладки (зеленый)
        tabBar.unselectedItemTintColor = .gray // Цвет не выбранной вкладки (серый)
        
        // Установите изображения и текст для вкладок
        listViewController.tabBarItem = UITabBarItem(title: "Список", image: listImage, tag: 0)
        cartViewController.tabBarItem = UITabBarItem(title: "Корзина", image: cartImage, tag: 1)
        infoViewController.tabBarItem = UITabBarItem(title: "Информация", image: infoImage, tag: 2)
        
        // Установите начальную вкладку (в данном случае, "Список")
        selectedIndex = 0
    }
}
