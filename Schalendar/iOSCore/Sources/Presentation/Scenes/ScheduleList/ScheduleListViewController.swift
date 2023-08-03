//
//  ScheduleListViewController.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/04.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import RxSwift
import RxCocoa
import SnapKit
import UIKit
import Utility

public protocol ScheduleListViewControllerDelegate: AnyObject {
    
    func didTapAddScheduleButton()
    
}

public final class ScheduleListViewController: UIViewController, RxMVVMViewController {
    
    let disposeBag: RxSwift.DisposeBag = .init()
    
    public let viewModel: ScheduleListViewModel
    
    public weak var delegate: ScheduleListViewControllerDelegate?
    
    let schedulesTableView: UITableView = {
        let tableView: UITableView = .init()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ScheduleCell")
        return tableView
    }()
    
    let addScheduleButton: UIBarButtonItem = .init(systemItem: .add)
    
    init(viewModel: ScheduleListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationItem.rightBarButtonItem = addScheduleButton
        bindViewModel()
        self.view.addSubview(schedulesTableView)
//        self.view.addSubview(addScheduleButton)
        schedulesTableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
//        addScheduleButton.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//        }
    }
    
    func bindViewModel() {
        let input: ScheduleListViewModel.Input = .init(addButtonTapSignal: addScheduleButton.rx.tap.asSignal())
        let output = viewModel.transform(input: input)
        [
            output.addButtonTapSignal
                .emit(with: self, onNext: { owner, _ in
                    owner.delegate?.didTapAddScheduleButton()
                }),
            output.schedules
                .drive(schedulesTableView.rx.items(cellIdentifier: "ScheduleCell")) { index, schedule, cell in
                    var config: UIListContentConfiguration = .cell()
                    config.text = schedule.title
                    config.secondaryText = schedule.date.description
                    cell.contentConfiguration = config
                },
        ]
            .forEach { $0.disposed(by: disposeBag) }
    }
}
