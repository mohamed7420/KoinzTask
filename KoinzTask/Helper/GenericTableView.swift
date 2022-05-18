//
//  GenericTableView.swift
//  KoinzTask
//
//  Created by Mohamed osama on 18/05/2022.
//

import Foundation
import UIKit

protocol CellProtocol{
    static var identifier: String{get}
}

extension CellProtocol{
    static var identifier: String{
        return String(describing: self)
    }
}

class GenericTableViewDataSource<T , Cell: UITableViewCell>: NSObject , TableViewDataSource where Cell: CellProtocol{
    
    typealias ItemClickListner = ((T? , IndexPath) -> Void)
    typealias ConfigureCollectionCell = (Cell , IndexPath , T?) -> Void
    typealias ItemWillDisplay = (Cell , IndexPath , T?) -> Void
    
    public var items: [T]?
    public var didSelectedItem: ItemClickListner!
    public var tableView: UITableView!
    public var configureCollectionCell: ConfigureCollectionCell!
    public var willDisplayItems: ItemWillDisplay!
    
    
    init(items: [T] , tableView: UITableView , configureCollectionCell: @escaping ConfigureCollectionCell , didSelectedItem: @escaping ItemClickListner , willDisplayItems: @escaping ItemWillDisplay) {
        self.items = items
        self.tableView = tableView
        self.configureCollectionCell = configureCollectionCell
        self.didSelectedItem = didSelectedItem
        self.willDisplayItems = willDisplayItems
        super.init()
        configureCollectionView(cell: Cell.self)
    }
    
    private func configureCollectionView<Cell: UITableViewCell>(cell: Cell.Type){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: cell)
        tableView.reloadData()
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items == nil ? 0 : items!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque() as Cell
        let item = unWrappingItem(indexPath: indexPath)
        configureCollectionCell(cell  , indexPath , item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = unWrappingItem(indexPath: indexPath)
        didSelectedItem(item , indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    func unWrappingItem(indexPath: IndexPath) -> T?{
        if let item = items?[indexPath.row] {
            return item
        }
        return nil
    }
    
}
