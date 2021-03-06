//  Created by Geoff Pado on 11/10/19.
//  Copyright © 2019 Cocoatype, LLC. All rights reserved.

import UIKit

extension UIColor {
    private static func named(_ name: String) -> UIColor {
        guard let color = self.init(named: name) else { fatalError("Couldn't load color named: \(name)") }
        return color
    }

    static let appBackground = UIColor.named("Background")
    static let appShadow = UIColor.named("Shadow")
    static let canvasBackground = UIColor.named("Canvas Background")
    static let cellTitle = UIColor.named("Cell Title")
    static let filmStripBackground = UIColor.named("Film Strip Background")
    static let filmStripIndicator = UIColor.named("Film Strip Indicator")
    static let newCellTint = UIColor.named("New Document Cell Tint")
    static let settingsRowTint = UIColor.named("Settings Row Tint")
    static let sidebarBackground = UIColor.named("Sidebar Background")
    static let sidebarBorder = UIColor.named("Sidebar Border")
    static let sidebarButtonBackground = UIColor.named("Sidebar Button Background")
    static let sidebarButtonHighlight = UIColor.named("Sidebar Button Highlight")
    static let sidebarButtonTint = UIColor.named("Sidebar Button Tint")

    static let tutorialIntroAccent = UIColor.named("Tutorial Intro Accent")
    static let tutorialIntroDismissButtonTitle = UIColor.named("Tutorial Intro Dismiss Button Title")
    static let tutorialIntroStartButtonTitle = UIColor.named("Tutorial Intro Start Button Title")
    static let tutorialIntroText = UIColor.named("Tutorial Intro Text")

    static let controlTint = UIColor.named("Web Control Tint")
}
