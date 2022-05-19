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

class GenericTableViewDataSource<T>: NSObject , TableViewDataSource{
    
    typealias ItemClickListner = ((T? , IndexPath) -> Void)
    typealias ConfigureCollectionCell = (UITableViewCell , IndexPath , T?) -> Void
    typealias ItemWillDisplay = (UITableViewCell , IndexPath , T?) -> Void
    typealias ScrollViewDidEndDragging = (Bool) -> Void
    
    public var isDataLoading: Bool = false
    public var items: [T]?
    public var didSelectedItem: ItemClickListner!
    public var tableView: UITableView!
    public var configureCollectionCell: ConfigureCollectionCell!
    public var willDisplayItems: ItemWillDisplay!
    public var paginateItemsList: ScrollViewDidEndDragging!
    
    init(items: [T] , tableView: UITableView , configureCollectionCell: @escaping ConfigureCollectionCell , didSelectedItem: @escaping ItemClickListner , willDisplayItems: @escaping ItemWillDisplay ,paginateItemsList: @escaping ScrollViewDidEndDragging) {
        
        self.items = items
        self.tableView = tableView
        self.configureCollectionCell = configureCollectionCell
        self.didSelectedItem = didSelectedItem
        self.willDisplayItems = willDisplayItems
        self.paginateItemsList = paginateItemsList
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: MovieTableCell.self)
        tableView.register(cell: BannerTableViewCell.self)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items == nil ? 0 : items!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if ((indexPath.row) % 5) == 0{
            let cell = tableView.deque() as BannerTableViewCell
            let item = unWrappingItem(indexPath: indexPath)
            configureCollectionCell(cell  , indexPath , item)
            return cell
        }
        let cell = tableView.deque() as MovieTableCell
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
        let item = unWrappingItem(indexPath: indexPath)
        willDisplayItems(cell , indexPath , item)
    }
    
    func unWrappingItem(indexPath: IndexPath) -> T?{
        if let item = items?[indexPath.row] {
            return item
        }
        return nil
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isDataLoading = false
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
    
    //Pagination
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        paginateItemsList(isDataLoading)
    }
}
