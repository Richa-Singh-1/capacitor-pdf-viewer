import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(PdfViewerPlugin)
public class PdfViewerPlugin: CAPPlugin {
    private let implementation = PdfViewer()

    @objc func loadPDF(_ call: CAPPluginCall) {
        let url = call.getString("url") ?? ""
        print("url", url)
        implementation.loadPDF(url: url)
        call.resolve()
    }
}
