//
//  ViewController.swift
//  LoginView
//
//  Created by Jaycee on 2019/11/02.
//  Copyright © 2019 Jaycee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var idVaildLabel: UILabel!
    @IBOutlet weak var pwVaildLabel: UILabel!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var baseView: UIView!
    
    var disposeBag = DisposeBag()
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    private func bindUI(){
        LoginButton.setTitle("Fill the Fields", for: .disabled)

        //      input : id, pw
        
        idTextField.rx.text.orEmpty
            .bind(to: viewModel.idText)
            .disposed(by: disposeBag)
        
        pwTextField.rx.text.orEmpty
            .bind(to: viewModel.pwText)
            .disposed(by: disposeBag)
        
        
        //      output : id vaild, pw vaild, loginbt enabled
        
        viewModel.idVaild
            .bind(to:idVaildLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
                
        viewModel.pwVaild
            .bind(to:pwVaildLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        Observable.combineLatest(viewModel.idVaild, viewModel.pwVaild) { $0 && $1}
            .bind(to: LoginButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    
    
    
    
    
}

