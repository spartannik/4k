//
//  Loading.swift
//  4ksoft
//
//  Created by Nikita Yashchenko on 14.09.2022.
//

import UIKit

final class LoadingViewController: UIViewController {

    private let loadingActivityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()

        indicator.style = .large
        indicator.color = .white

        indicator.startAnimating()

        indicator.autoresizingMask = [
            .flexibleLeftMargin, .flexibleRightMargin,
            .flexibleTopMargin, .flexibleBottomMargin
        ]

        return indicator
    }()

    private let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)

        blurEffectView.alpha = 0.8

        blurEffectView.autoresizingMask = [
            .flexibleWidth, .flexibleHeight
        ]

        return blurEffectView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        openMainViewController()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        blurEffectView.frame = self.view.bounds
        view.insertSubview(blurEffectView, at: 0)

        loadingActivityIndicator.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        view.addSubview(loadingActivityIndicator)
        
    }

    private func openMainViewController() {
        
        let mainViewController = ViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.present(mainViewController, animated: false)
        }
    }

}
