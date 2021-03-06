//  Created by Geoff Pado on 3/8/20.
//  Copyright © 2020 Cocoatype, LLC. All rights reserved.

import Data
import UIKit

class TutorialIntroViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .formSheet
        preferredContentSize = CGSize(width: 425, height: 550)
    }

    override func loadView() {
        view = tutorialIntroView
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Defaults.seenTutorial = true
    }

    // MARK: Boilerplate

    private let tutorialIntroView = TutorialIntroView()

    @available(*, unavailable)
    required init(coder: NSCoder) {
        let typeName = NSStringFromClass(type(of: self))
        fatalError("\(typeName) does not implement init(coder:)")
    }
}
