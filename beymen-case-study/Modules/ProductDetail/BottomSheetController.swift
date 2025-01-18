//
//  BottomSheetController.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation
import UIKit

final class BottomSheetTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

    private let bottomSheetController: BottomSheetController
    
    init(bottomSheetController: BottomSheetController) {
        self.bottomSheetController = bottomSheetController
    }
    
    // MARK: - UIViewControllerTransitioningDelegate Methods
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return bottomSheetController
    }
}

final class BottomSheetController: UIPresentationController {
    var heightRatio: CGFloat = 0.58
    var presentingHeightRatio: CGFloat { 1 - heightRatio }
    var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()
    var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
    let blurEffectView: UIVisualEffectView!
    
    @objc func dismiss(){
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismiss))
        swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.dismiss))
        swipeGestureRecognizer.delegate = self
        swipeGestureRecognizer.direction = .down
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.isUserInteractionEnabled = true
        blurEffectView.addGestureRecognizer(tapGestureRecognizer)
        
        presentedViewController.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    override var frameOfPresentedViewInContainerView: CGRect{
        let bottomSheetHeight = (self.presentedViewController as! ListDetailBottomsheetViewController).view.frame.size.height
        
        return CGRect(origin: CGPoint(x: 0, y: self.containerView!.frame.height - bottomSheetHeight), size: CGSize(width: self.containerView!.frame.width, height: bottomSheetHeight))
    }
    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        self.presentedView?.layoutIfNeeded()
    }
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
            self.blurEffectView.alpha = 0
        }, completion: { (UIViewControllerTransitionCoordinatorContext) in
            self.blurEffectView.removeFromSuperview()
        })
    }
    override func presentationTransitionWillBegin() {
        self.blurEffectView.alpha = 0
        self.containerView?.addSubview(blurEffectView)
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
            self.blurEffectView.alpha = 0.7
        }, completion: { (UIViewControllerTransitionCoordinatorContext) in

        })
    }
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView!.layer.masksToBounds = true
        presentedView!.layer.cornerRadius = 10
    }
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        self.presentedView?.frame = frameOfPresentedViewInContainerView
        blurEffectView.frame = containerView!.bounds
    }
}

extension BottomSheetController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let dismissable = presentedViewController as? DragToDismissableScrollingContent,
              let scrollView = dismissable.scrollView else { return false }
        return scrollView.contentOffset.y <= 0
    }
}
