//
//  BaseViewController.swift
//  UIElements
//
//  Copyright © 2019 Jon Olivet
//

import BasicCommons
import Lottie

/// WavezPosition - Position Enum
public enum WavezPosition {
    static var controller: CGFloat = 1
    static var modal: CGFloat = 2
    static var header: CGFloat = 3
}

/// ActivityIndicatorViewModel public struc
public struct ActivityIndicatorViewModel {
    let title: String
    let detail: String
    let waveIsGray: Bool
    let showHeader: Bool

    /// ActivityIndicatorViewModel init
    /// - Parameter title: title
    /// - Parameter detail: detail
    /// - Parameter waveIsGray: waveIsGray
    /// - Parameter showHeader: showHeader
    public init(title: String? = "",
                detail: String? = "",
                waveIsGray: Bool = false,
                showHeader: Bool = true) {

        self.title = title!
        self.detail = detail!
        self.waveIsGray = waveIsGray
        self.showHeader = showHeader
    }
}

open class BaseViewController: UIViewController {

    private var loadingView: MainActivityIndicator?
    private var errorMessage: FullScreenMessageErrorAnimated?

    override open func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .all
        setNeedsStatusBarAppearanceUpdate()
        backgroundGradient()
    }

    open func backgroundGradient() {
        let gradient = MainGradientView.whiteToBlue.gradientLayer
        gradient.frame = UIScreen.main.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }

    open func genericDisplayLoadingView(viewModel: ActivityIndicatorViewModel? = nil) {

        loadingView = MainActivityIndicator(
            title: viewModel?.title ?? "LOADING".localized,
            detail: viewModel?.detail ?? "WAIT".localized,
            showHeader: false
        )

        if let loadingView = loadingView {
            if self.navigationController != nil {
                self.navigationController?.view.addSubview(loadingView)
            } else {
                self.view.addSubview(loadingView)
                loadingView.layer.zPosition = 2
            }
            loadingView.alpha = 1
        }
    }

    open func genericDisplayLoadingViewOnView(viewModel: ActivityIndicatorViewModel) {
        loadingView = MainActivityIndicator(
            title: viewModel.title,
            detail: viewModel.detail,
            showHeader: viewModel.showHeader
        )
        if let loadingView = loadingView {
            self.view.addSubview(loadingView)
            loadingView.layer.zPosition = 2
            loadingView.alpha = 1
        }
    }

    open func genericHideLoadingView() {
        if let loadingView = loadingView {
            UIView.animate(
                withDuration: 0.25,
                animations: {
                    loadingView.alpha = 0
                },
                completion: { _ in
                    loadingView.removeFromSuperview()
                }
            )
        }
    }
    open func genericHideLoadingViewForView() {
        if let loadingView = loadingView {
            if (self.navigationController != nil &&
                type(of: self.navigationController!.view.subviews.last!) == MainActivityIndicator.self) ||
                type(of: self.view.subviews.last!) == MainActivityIndicator.self {

                UIView.animate(
                    withDuration: 0.25,
                    animations: {
                        loadingView.alpha = 0
                    },
                    completion: { _ in
                        loadingView.removeFromSuperview()
                    }
                )
            }
        }
    }

    open func genericDisplayErrorView(typeOfError: FullScreenErrorType, retryAction: Selector, closeAction: Selector) {
        guard errorMessage == nil else {
            return
        }
        var title: String {
            typeOfError == .internet
                ? "INTERNET_ERROR_TITLE".localized
                : "SERVICE_ERROR_TITLE".localized
        }
        var message: String {
            typeOfError == .internet
                ? "INTERNET_ERROR_MESSAGE".localized
                : "SERVICE_ERROR_MESSAGE".localized
        }
        let animationView = createAnimationView(typeOfError)

        errorMessage = FullScreenMessageErrorAnimated(
            withTitle: title,
            message: message,
            animationView: animationView,
            buttonsTitles: ["RETRY".localized, "CLOSE".localized],
            buttonsActions: [retryAction, closeAction],
            buttonsStyles: [UIButton.ButtonTypes.first, UIButton.ButtonTypes.second],
            target: self,
            frame: UIScreen.main.bounds
        )

        if let errorMessage = errorMessage {
            if self.navigationController != nil {
                self.navigationController?.view.addSubview(errorMessage)
            } else {
                self.view.addSubview(errorMessage)
                errorMessage.layer.zPosition = 2
            }
            errorMessage.alpha = 1
        }
    }

    open func createAnimationView(_ type: FullScreenErrorType) -> AnimationView {
        let animation: MainAnimation = {
            switch type {
            case .internet:
                return MainAnimation.internetError
            case .service:
                return MainAnimation.serviceError
            }
        }()
        let view = animation.lottieAnimationView
        view.loopMode = .loop
        return view
    }

    open func genericHideErrorView() {
        errorMessage?.removeFromSuperview(animated: true)
        errorMessage = nil
    }

    open var motionShakeUrl: String = ""

    override open func becomeFirstResponder() -> Bool {
        true
    }
}
