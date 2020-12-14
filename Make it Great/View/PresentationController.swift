//
//  PresentationController.swift
//  Make it Great
//
//  Created by Elias Ferreira on 12/12/20.
//

import UIKit

class PresentationController: UIPresentationController {

  let blurEffectView: UIVisualEffectView!
  var tapGestureRecognizer = UITapGestureRecognizer()
  var proportion: CGFloat

  override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
    let blurEffect = UIBlurEffect(style: .dark)
    blurEffectView = UIVisualEffectView(effect: blurEffect)
    proportion = 560
    super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    blurEffectView.isUserInteractionEnabled = true
    blurEffectView.addGestureRecognizer(tapGestureRecognizer)
  }

  override var frameOfPresentedViewInContainerView: CGRect {
    CGRect(
      origin: CGPoint(x: 0, y: containerView!.frame.height - proportion),
      size: CGSize(
        width: containerView!.frame.width,
        height:  proportion
      )
    )
  }

  override func presentationTransitionWillBegin() {
    blurEffectView.alpha = 0
    containerView?.addSubview(blurEffectView)
    presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
      self.blurEffectView.alpha = 0.5
    }, completion: nil)
  }

  override func dismissalTransitionWillBegin() {
    presentedViewController.transitionCoordinator?.animate(alongsideTransition: {
      (UIViewControllerTransitionCoordinatorContext) in
      self.blurEffectView.alpha = 0
    }, completion: {
      (UIViewControllerTransitionCoordinatorContext) in
      self.blurEffectView.removeFromSuperview()
    })
  }

  override func containerViewWillLayoutSubviews() {
    super.containerViewWillLayoutSubviews()
    presentedView!.roundCorners([.topLeft, .topRight], radius: 8)
  }

  override func containerViewDidLayoutSubviews() {
    super.containerViewDidLayoutSubviews()
    presentedView?.frame = frameOfPresentedViewInContainerView
    blurEffectView.frame = containerView!.bounds
  }

  @objc func dismissController() {
    presentedViewController.dismiss(animated: true, completion: nil)
  }

}

extension UIView {
  func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners,
                            cornerRadii: CGSize(width: radius, height: radius)
    )
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    layer.mask = mask
  }
}
