//
//  BaseViewController.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/04.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import RxSwift
import UIKit

protocol RxMVVMViewController: UIViewController {
    
    associatedtype ViewModelType: RxViewModel
    
    var disposeBag: DisposeBag { get }
    
    var viewModel: ViewModelType { get }
    
    func bindViewModel()
    
}
