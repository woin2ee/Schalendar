//
//  AddScheduleViewController.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/04.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import RxSwift
import RxCocoa
import SnapKit
import UIKit

public protocol AddScheduleViewControllerDelegate: AnyObject {
    
    func didTapCompleteButton()
    
    func didTapCancelButton()
    
}

public final class AddScheduleViewController: UIViewController, RxMVVMViewController {
    
    let disposeBag: RxSwift.DisposeBag = .init()
    
    let viewModel: AddScheduleViewModel
    
    public weak var delegate: AddScheduleViewControllerDelegate?
    
    let titleTextField: UITextField = {
        let textField: UITextField = .init()
        textField.placeholder = "제목"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker: UIDatePicker = .init()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()
    
    let timePicker: UIDatePicker = {
        let datePicker: UIDatePicker = .init()
        datePicker.datePickerMode = .time
        return datePicker
    }()
    
    let completeButton: UIBarButtonItem = {
        let button: UIBarButtonItem = .init(title: "완료")
        button.style = .done
        return button
    }()
    
    let cancelButton: UIBarButtonItem = .init(title: "취소")
    
    init(viewModel: AddScheduleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        bindViewModel()
        self.navigationItem.title = "상세"
        
        self.navigationItem.rightBarButtonItem = completeButton
        self.navigationItem.leftBarButtonItem = cancelButton
        
        self.view.addSubview(titleTextField)
        self.view.addSubview(datePicker)
        self.view.addSubview(timePicker)
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(10)
        }
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(10)
        }
        timePicker.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(20)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(10)
        }
    }
    
    func bindViewModel() {
        let input: AddScheduleViewModel.Input = .init(
            title: titleTextField.rx.text.orEmpty.asDriver(),
            date: .just(.now), // FIXME: 
            completeSignal: completeButton.rx.tap.asSignal(),
            cancelSignal: cancelButton.rx.tap.asSignal()
        )
        let output = viewModel.transform(input: input)
        [
            output.completeSignal
                .emit(with: self, onNext: { owner, _ in
                    owner.delegate?.didTapCompleteButton()
                }),
            output.cancelSignal
                .emit(with: self, onNext: { owner, _ in
                    owner.delegate?.didTapCancelButton()
                }),
            output.canComplete
                .drive(completeButton.rx.isEnabled)
        ]
            .forEach { $0.disposed(by: disposeBag) }
    }
}
