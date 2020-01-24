//  Created by Geoff Pado on 12/25/19.
//  Copyright © 2019 Cocoatype, LLC. All rights reserved.

import UIKit

protocol EditingViewLayoutManager {
    func layout(_ editingView: EditingView)
}

extension EditingViewLayoutManager {
    private func firstSubview<ViewType: UIView>(of viewType: ViewType.Type, in view: UIView) -> ViewType {
        guard let subview = (view.subviews.compactMap { $0 as? ViewType }.first) else { fatalError("Could not find subview of type \(ViewType.self) in \(view)") }
        return subview
    }

    func drawingView(in editingView: EditingView) -> DrawingView {
        return firstSubview(of: DrawingView.self, in: editingView)
    }

    func filmStripView(in editingView: EditingView) -> FilmStripView {
        return firstSubview(of: FilmStripView.self, in: editingView)
    }

    func playButton(in editingView: EditingView) -> PlayButton {
        return firstSubview(of: PlayButton.self, in: editingView)
    }

    func galleryButton(in editingView: EditingView) -> GalleryButton {
        return firstSubview(of: GalleryButton.self, in: editingView)
    }

    func exportButton(in editingView: EditingView) -> ExportButton {
        return firstSubview(of: ExportButton.self, in: editingView)
    }

    func toolsButton(in editingView: EditingView) -> ToolsButton {
        return firstSubview(of: ToolsButton.self, in: editingView)
    }
}