//
//  PopUpView.swift
//  RxCocoa_PopUp
//
//  Created by humanplus on 2020/06/15.
//  Copyright © 2020 humanplus. All rights reserved.
//


import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxRelay


class Level1HistoryPopUpView {
    
    private static let sharedInstance = Level1HistoryPopUpView()
    private var backgroundView: UIView?
    private var popupView: UIView?
    private var cancelButton: UIButton?
    private var confirmButton: UIButton?
    private var oneMonthButton: UIButton?
    private var threeMonthButton: UIButton?
    private var sixMonthButton: UIButton?
    private var directInputButton: UIButton?
    private var periodSettingTitle: UILabel?
    private var fromTheLatestButton: UIButton?
    private var byPastOrderButton: UIButton?
    private var sortStandardTitle: UILabel?
    private var titleLabel: UILabel?
    
    var disposeBag = DisposeBag()

    
    
    @objc class func btnDidTapped(sender:UIButton){
        print("buttonDidTapped...")
    }
    
    @objc class func confirm(){
        print("confirm...")
        
    }
    
    class func show() {
        
        let backgroundView : UIView = {
            let view = UIView(frame: UIScreen.main.bounds)
            view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
            return view
        }()
        
        let popupView : UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.white
            view.layer.cornerRadius = 22
            return view
        }()
        
        let cancleButton : UIButton = {
            let button = UIButton()
            button.setTitle("취소", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .gray
            button.layer.cornerRadius = 8
            button.isEnabled = true
            button.addTarget(self, action: #selector(hide), for: .touchUpInside)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            return button
        }()
        
        let confirmButton : UIButton = {
            let button = UIButton()
            button.setTitle("확인", for: .normal)
            button.isEnabled = false
            button.addTarget(self, action: #selector(confirm), for: .touchUpInside)
            button.setTitleColor(.darkGray, for: .disabled)
            button.setTitleColor(.white, for: .normal)
            button.setBackgroundColor(UIColor(white: 242.0 / 255.0, alpha: 1.0), for: .disabled)
            button.setBackgroundColor(.black, for: .normal)
            button.layer.cornerRadius = 8
            button.clipsToBounds = true
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            return button
        }()
        
        
        let oneMonthButton : UIButton = {
            let button = UIButton()
            button.setTitle("1개월", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.setBackgroundColor(.white, for: .normal)
            button.setBackgroundColor(.orange, for: .selected)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.gray.cgColor
            button.clipsToBounds = true
            button.adjustsImageWhenHighlighted = false
            return button
        }()
        
        
        let threeMonthButton : UIButton = {
            let button = UIButton()
            button.setTitle("3개월", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.setBackgroundColor(.white, for: .normal)
            button.setBackgroundColor(.orange, for: .selected)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.gray.cgColor
            button.clipsToBounds = true
//            button.addTarget(self, action: #selector(btnDidTapped(sender:)), for: .touchUpInside)
            button.adjustsImageWhenHighlighted = false
            return button
        }()
        
        
        let sixMonthButton : UIButton = {
            let button = UIButton()
            button.setTitle("6개월", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.setBackgroundColor(.white, for: .normal)
            button.setBackgroundColor(.orange, for: .selected)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.gray.cgColor
            button.clipsToBounds = true
//            button.addTarget(self, action: #selector(btnDidTapped(sender:)), for: .touchUpInside)
            button.adjustsImageWhenHighlighted = false
            return button
        }()
        
        
        let directInputButton : UIButton = {
            let button = UIButton()
            button.setTitle("직접입력", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.setBackgroundColor(.white, for: .normal)
            button.setBackgroundColor(.orange, for: .selected)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.gray.cgColor
            button.clipsToBounds = true
//            button.addTarget(self, action: #selector(btnDidTapped(sender:)), for: .touchUpInside)
            button.adjustsImageWhenHighlighted = false
            return button
        }()
        
        
        let periodSettingTitle : UILabel = {
            let label = UILabel()
            label.text = "기간 설정"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
        
        
        
        let fromTheLatestButton : UIButton = {
            let button = UIButton()
            button.setTitle("최신순", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.setBackgroundColor(.white, for: .normal)
            button.setBackgroundColor(.orange, for: .selected)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.gray.cgColor
            button.clipsToBounds = true
//            button.addTarget(self, action: #selector(btnDidTapped(sender:)), for: .touchDown)
            button.adjustsImageWhenHighlighted = false
            return button
        }()
        
        
        
        let byPastOrderButton : UIButton = {
            let button = UIButton()
            button.setTitle("과거순", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.setBackgroundColor(.white, for: .normal)
            button.setBackgroundColor(.orange, for: .selected)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.gray.cgColor
            button.clipsToBounds = true
//            button.addTarget(self, action: #selector(btnDidTapped(sender:)), for: .touchDown)
            button.adjustsImageWhenHighlighted = false
            return button
        }()
        
        
        
        let sortStandardTitle : UILabel = {
            let label = UILabel()
            label.text = "정렬 기준"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
        
        
        let titleLabel : UILabel = {
            let label = UILabel()
            label.text = "내역 조회"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            return label
        }()
        
        
        

        //MARK: RxSwift, RxCocoa
        
        let fromTheLatestRelay = BehaviorRelay(value: false)
        let byPastOrderRelay = BehaviorRelay(value: false)
        let oneMonthRelay = BehaviorRelay(value: false)
        let threeMonthRelay = BehaviorRelay(value: false)
        let sixMonthRelay = BehaviorRelay(value: false)
        let directInputRelay = BehaviorRelay(value: false)
        

        let fromTheLatest = fromTheLatestButton.rx.tap.map{true}
        
        fromTheLatest
            .asDriver(onErrorJustReturn: false)
            .drive(fromTheLatestButton.rx.isSelected)
            .disposed(by: sharedInstance.disposeBag)

        fromTheLatest
            .map{!$0}
            .asDriver(onErrorJustReturn: false)
            .drive(byPastOrderButton.rx.isSelected)
            .disposed(by: sharedInstance.disposeBag)
        
        fromTheLatest
            .asDriver(onErrorJustReturn: false)
            .drive(fromTheLatestRelay)
            .disposed(by: sharedInstance.disposeBag)
        
        fromTheLatest
            .map{!$0}
            .asDriver(onErrorJustReturn: false)
            .drive(byPastOrderRelay)
            .disposed(by: sharedInstance.disposeBag)
        
        
        let byPastOrder = byPastOrderButton.rx.tap.map{true}
        
        byPastOrder
            .asDriver(onErrorJustReturn: false)
            .drive(byPastOrderButton.rx.isSelected)
            .disposed(by: sharedInstance.disposeBag)
        
        byPastOrder
            .map{!$0}
            .asDriver(onErrorJustReturn: false)
            .drive(fromTheLatestButton.rx.isSelected)
            .disposed(by: sharedInstance.disposeBag)

        byPastOrder
            .asDriver(onErrorJustReturn: false)
            .drive(byPastOrderRelay)
            .disposed(by: sharedInstance.disposeBag)
        
        byPastOrder
            .map{!$0}
            .asDriver(onErrorJustReturn: false)
            .drive(fromTheLatestRelay)
            .disposed(by: sharedInstance.disposeBag)
        
        
        let oneMonth = oneMonthButton.rx.tap.map{true}
        
        oneMonth
            .asDriver(onErrorJustReturn: false)
            .drive(oneMonthButton.rx.isSelected)
            .disposed(by: sharedInstance.disposeBag)

        oneMonth
            .map{!$0}
            .catchErrorJustReturn(false)
            .observeOn(MainScheduler.instance)
            .bind(to: threeMonthButton.rx.isSelected, sixMonthButton.rx.isSelected, directInputButton.rx.isSelected)
            .disposed(by: sharedInstance.disposeBag)
        
        oneMonth
            .asDriver(onErrorJustReturn: false)
            .drive(oneMonthRelay)
            .disposed(by: sharedInstance.disposeBag)

        oneMonth
            .map{!$0}
            .catchErrorJustReturn(false)
            .observeOn(MainScheduler.instance)
            .bind(to: threeMonthRelay, sixMonthRelay, directInputRelay)
            .disposed(by: sharedInstance.disposeBag)
        
        
        let threeMonth = threeMonthButton.rx.tap.map{true}
        
        threeMonth
            .asDriver(onErrorJustReturn: false)
            .drive(threeMonthButton.rx.isSelected)
            .disposed(by: sharedInstance.disposeBag)

        threeMonth
            .map{!$0}
            .observeOn(MainScheduler.instance)
            .bind(to: oneMonthButton.rx.isSelected, sixMonthButton.rx.isSelected, directInputButton.rx.isSelected)
            .disposed(by: sharedInstance.disposeBag)
        
        threeMonth
            .asDriver(onErrorJustReturn: false)
            .drive(threeMonthRelay)
            .disposed(by: sharedInstance.disposeBag)

        threeMonth
            .map{!$0}
            .catchErrorJustReturn(false)
            .observeOn(MainScheduler.instance)
            .bind(to: oneMonthRelay, sixMonthRelay, directInputRelay)
            .disposed(by: sharedInstance.disposeBag)
        
        
        let sixMonth = sixMonthButton.rx.tap.map{true}
        
        sixMonth
            .asDriver(onErrorJustReturn: false)
            .drive(sixMonthButton.rx.isSelected)
            .disposed(by: sharedInstance.disposeBag)

        sixMonth
            .map{!$0}
            .observeOn(MainScheduler.instance)
            .bind(to: oneMonthButton.rx.isSelected, threeMonthButton.rx.isSelected, directInputButton.rx.isSelected)
            .disposed(by: sharedInstance.disposeBag)
        
        sixMonth
            .asDriver(onErrorJustReturn: false)
            .drive(sixMonthRelay)
            .disposed(by: sharedInstance.disposeBag)

        sixMonth
            .map{!$0}
            .catchErrorJustReturn(false)
            .observeOn(MainScheduler.instance)
            .bind(to: oneMonthRelay, threeMonthRelay, directInputRelay)
            .disposed(by: sharedInstance.disposeBag)


        let directInput = directInputButton.rx.tap.map{true}
        
        directInput
            .asDriver(onErrorJustReturn: false)
            .drive(directInputButton.rx.isSelected)
            .disposed(by: sharedInstance.disposeBag)

        directInput
            .map{!$0}
            .observeOn(MainScheduler.instance)
            .bind(to: oneMonthButton.rx.isSelected, threeMonthButton.rx.isSelected, sixMonthButton.rx.isSelected)
            .disposed(by: sharedInstance.disposeBag)

        directInput
            .asDriver(onErrorJustReturn: false)
            .drive(directInputRelay)
            .disposed(by: sharedInstance.disposeBag)

        directInput
            .map{!$0}
            .catchErrorJustReturn(false)
            .observeOn(MainScheduler.instance)
            .bind(to: oneMonthRelay, threeMonthRelay, sixMonthRelay)
            .disposed(by: sharedInstance.disposeBag)

        
        let topValild = Observable.combineLatest(fromTheLatestRelay, byPastOrderRelay)
            .map{[$0,$1]}
            .map{$0.filter{$0 == true}.count == 1 ? true : false}
        
        
        let bottomValild = Observable.combineLatest(oneMonthRelay, threeMonthRelay, sixMonthRelay, directInputRelay)
            .map{[$0,$1,$2,$3]}
            .map{$0.filter{$0 == true}.count == 1 ? true : false}
            
        
        Observable.combineLatest(topValild, bottomValild)
            .map{[$0,$1]}
            .map{$0.filter{$0 == true}.count == 2 ? true : false}
            .asDriver(onErrorJustReturn: false)
            .drive(confirmButton.rx.isEnabled)
            .disposed(by: sharedInstance.disposeBag)
        
        
        
        if let window = UIApplication.shared.windows.first{
            
            [backgroundView, popupView].forEach{ window.addSubview($0) }
            
            [cancleButton, confirmButton, oneMonthButton, threeMonthButton, sixMonthButton, directInputButton, periodSettingTitle, fromTheLatestButton, byPastOrderButton, sortStandardTitle,titleLabel].forEach{ popupView.addSubview($0) }
            
            
            sharedInstance.backgroundView = backgroundView
            sharedInstance.popupView = popupView
            sharedInstance.cancelButton = cancleButton
            sharedInstance.confirmButton = confirmButton
            sharedInstance.oneMonthButton = oneMonthButton
            sharedInstance.threeMonthButton = threeMonthButton
            sharedInstance.sixMonthButton = sixMonthButton
            sharedInstance.directInputButton = directInputButton
            sharedInstance.periodSettingTitle = periodSettingTitle
            sharedInstance.fromTheLatestButton = fromTheLatestButton
            sharedInstance.byPastOrderButton = byPastOrderButton
            sharedInstance.sortStandardTitle = sortStandardTitle
            sharedInstance.titleLabel = titleLabel
            
            
            // MARK: setup AutoLayout
            
            popupView.snp.makeConstraints { make in
                make.leading.equalTo(0)
                make.trailing.equalTo(0)
                make.top.equalTo(titleLabel.snp.top).offset(-30)
                make.bottom.equalTo(UIScreen.main.bounds.height)
            }
            
            cancleButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-10)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalTo(confirmButton.snp.leading).offset(-10)
                make.width.equalTo(UIScreen.main.bounds.width/5)
                make.height.equalTo(50)
            }
            
            confirmButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-10)
                make.trailing.equalToSuperview().offset(-20)
                make.leading.equalTo(confirmButton.snp.leading)
                //                make.width.equalTo(confirmButton)
                make.height.equalTo(50)
            }
            
            oneMonthButton.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalTo(threeMonthButton.snp.leading).offset(-5)
                make.bottom.equalTo(confirmButton.snp.top).offset(-10)
                make.height.equalTo(40)
                make.height.equalTo(threeMonthButton)
                make.height.equalTo(sixMonthButton)
                make.height.equalTo(directInputButton)
                make.width.equalTo(threeMonthButton)
                make.width.equalTo(sixMonthButton)
                make.width.equalTo(directInputButton)
            }
            
            threeMonthButton.snp.makeConstraints { make in
                make.trailing.equalTo(sixMonthButton.snp.leading).offset(-5)
                make.bottom.equalTo(oneMonthButton)
            }
            
            sixMonthButton.snp.makeConstraints { make in
                make.trailing.equalTo(directInputButton.snp.leading).offset(-5)
                make.bottom.equalTo(oneMonthButton)
            }
            
            directInputButton.snp.makeConstraints { make in
                make.trailing.equalToSuperview().offset(-20)
                make.bottom.equalTo(oneMonthButton)
            }
            
            periodSettingTitle.snp.makeConstraints { make in
                make.leading.equalTo(oneMonthButton.snp.leading)
                make.bottom.equalTo(oneMonthButton.snp.top).offset(-10)
            }
            
            fromTheLatestButton.snp.makeConstraints { make in
                make.leading.equalTo(oneMonthButton.snp.leading)
                make.trailing.equalTo(byPastOrderButton.snp.leading).offset(-5)
                make.bottom.equalTo(periodSettingTitle.snp.top).offset(-30)
                make.height.equalTo(oneMonthButton)
                make.height.equalTo(byPastOrderButton)
                make.width.equalTo(byPastOrderButton)
            }
            
            byPastOrderButton.snp.makeConstraints { make in
                make.trailing.equalTo(directInputButton.snp.trailing)
                make.bottom.equalTo(fromTheLatestButton.snp.bottom)
            }
            
            sortStandardTitle.snp.makeConstraints { make in
                make.leading.equalTo(oneMonthButton.snp.leading)
                make.bottom.equalTo(fromTheLatestButton.snp.top).offset(-10)
            }
            
            titleLabel.snp.makeConstraints { make in
                make.bottom.equalTo(sortStandardTitle.snp.top).offset(-20)
                make.leading.equalTo(cancleButton.snp.leading)
                make.trailing.equalTo(confirmButton.snp.trailing).offset(-20)
            }
            
            window.layoutIfNeeded()
            
            
            let height = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 99
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .transitionCrossDissolve, animations: {
                popupView.snp.updateConstraints({ make in
                    make.bottom.equalTo(-(height + 10))
                })
                window.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    
    @objc class func hide() {
        if let popupView = sharedInstance.popupView,
            let backgroundView = sharedInstance.backgroundView,
            let cancelButton = sharedInstance.cancelButton,
            let confirmButton = sharedInstance.confirmButton,
            let oneMonthButton = sharedInstance.oneMonthButton,
            let threeMonthButton = sharedInstance.threeMonthButton,
            let sixMonthButton = sharedInstance.sixMonthButton,
            let directInputButton = sharedInstance.directInputButton,
            let periodSettingTitle = sharedInstance.periodSettingTitle,
            let fromTheLatestButton = sharedInstance.fromTheLatestButton,
            let byPastOrderButton = sharedInstance.byPastOrderButton,
            let sortStandardTitle = sharedInstance.sortStandardTitle,
            let titleLabel = sharedInstance.titleLabel{
            
            titleLabel.removeFromSuperview()
            sortStandardTitle.removeFromSuperview()
            byPastOrderButton.removeFromSuperview()
            fromTheLatestButton.removeFromSuperview()
            periodSettingTitle.removeFromSuperview()
            directInputButton.removeFromSuperview()
            sixMonthButton.removeFromSuperview()
            threeMonthButton.removeFromSuperview()
            oneMonthButton.removeFromSuperview()
            confirmButton.removeFromSuperview()
            cancelButton.removeFromSuperview()
            popupView.removeFromSuperview()
            backgroundView.removeFromSuperview()
        }
    }
    
    
}



