//  Created by Geoff Pado on 7/14/19.
//  Copyright © 2019 Cocoatype, LLC. All rights reserved.

import UIKit

class SceneViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        embedInContainer(GalleryViewController())
    }

    override func loadView() {
        view = SceneView()
    }

    @objc func showGallery() {
        transitionInContainer(to: GalleryViewController())
    }

    @objc func showEditingView(_ sender: GalleryViewController, for event: GallerySelectionEvent) {
        transitionInContainer(to: EditingViewController(document: event.document))
    }

    // MARK: Embedding

    func embedInContainer(_ newChild: UIViewController) {
        embed(newChild, embedView: containerView)
    }

    func transitionInContainer(to newChild: UIViewController) {
        transition(to: newChild, embedView: containerView)
    }

    // MARK: Status Bar

    override var prefersStatusBarHidden: Bool { return true }

    // MARK: Boilerplate

    private let documentStore = DocumentStore()
    private var containerView: ContainerView { return sceneView.containerView }
    private var sidebarView: SidebarView { return sceneView.sidebarView }
    private var sceneView: SceneView {
        guard let sceneView = view as? SceneView else { fatalError("Incorrect view type: \(String(describing: view))") }
        return sceneView
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        let typeName = NSStringFromClass(type(of: self))
        fatalError("\(typeName) does not implement init(coder:)")
    }
}
