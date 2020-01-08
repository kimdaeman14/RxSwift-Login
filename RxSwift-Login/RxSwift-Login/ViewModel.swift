//
//  ViewModel.swift
//  LoginView
//
//  Created by Jaycee on 2019/11/04.
//  Copyright © 2019 Jaycee. All rights reserved.
//

import Foundation
import RxSwift


//환상적이군..

class ViewModel {
    
    let idText = BehaviorSubject(value: "")
    let pwText = BehaviorSubject(value: "")
    
    let idVaild = BehaviorSubject(value: false)
    let pwVaild = BehaviorSubject(value: false)
    
    init() {
        _ = idText.distinctUntilChanged()
            .map(checkIdVaild)
            .bind(to: idVaild)
    
        _ = pwText.distinctUntilChanged()
        .map(checkPasswordVaild)
        .bind(to: pwVaild)
    }
    
    
    // MARK: - Business Logic
    
    private func checkIdVaild(id:String) -> Bool{
        return id.contains("@")&&id.contains(".")
    }
    private func checkPasswordVaild(pw:String) -> Bool{
        return pw.count > 5
    }
    
}


