//  Created by Geoff Pado on 8/12/19.
//  Copyright © 2019 Cocoatype, LLC. All rights reserved.

import Foundation

class SettingsContentProvider: NSObject {
    init(otherAppEntries: [AppEntry] = []) {
        self.otherAppEntries = otherAppEntries
        super.init()
        refreshOtherAppsList()
    }

    // MARK: Data

    func sectionIndex(for sectionType: SettingsContentSection.Type) -> Int? {
        return sections.firstIndex(where: { type(of: $0) == sectionType })
    }

    var numberOfSections: Int {
        return sections.count
    }

    func numberOfItems(inSectionAtIndex index: Int) -> Int {
        return sections[index].items.count
    }

    func section(at index: Int) -> SettingsContentSection {
        return sections[index]
    }

    func item(at indexPath: IndexPath) -> SettingsContentItem {
        return sections[indexPath.section].items[indexPath.row]
    }

    // MARK: Other Apps

    private var otherAppEntries: [AppEntry] {
        didSet {
            guard let otherAppsSectionIndex = sectionIndex(for: OtherAppsSection.self) else { return }
            NotificationCenter.default.post(name: SettingsContentProvider.didChangeContent, object: self, userInfo: [
                SettingsContentProvider.sectionIndexSetKey: IndexSet(integer: otherAppsSectionIndex)
            ])
        }
    }

    private func refreshOtherAppsList() {
        guard otherAppEntries.isEmpty else { return }
        AppListFetcher().fetchAppEntries { [weak self] appEntries, _ in
            self?.otherAppEntries = appEntries ?? []
        }
    }

    // MARK: Notifications

    static let didChangeContent = Notification.Name("SettingsContentProvider.didChangeContent")
    static let sectionIndexSetKey = "SettingsContentProvider.sectionIndexSetKey"

    // MARK: Boilerplate

    private var sections: [SettingsContentSection] {
        var sections = [SettingsContentSection]()

        sections.append(contentsOf: ([
            AboutSection(),
            OtherAppsSection(otherApps: otherAppEntries)
        ] as [SettingsContentSection]))

        return sections
    }
}
