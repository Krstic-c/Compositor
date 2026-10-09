import SwiftUI

extension Text {
    /// `Text(someString)` shows its string as is. This overload, preferred for a plain `String`, looks the string up in
    /// the string catalog first, so names built at run time (enum labels, error messages) are translated too.
    /// Anything not in the catalog shows unchanged. User content (project and layer names) uses `Text(verbatim:)`.
    init(_ string: String) {
        self.init(LocalizedStringKey(string))
    }
}

extension View {
    /// Same lookup for tooltips passed as a plain `String`.
    func help(_ text: String) -> some View {
        help(LocalizedStringKey(text))
    }
}

/// A translated string for AppKit (menus, alerts, panels), which has no `LocalizedStringKey`.
func tr(_ key: String) -> String {
    String(localized: String.LocalizationValue(key))
}
