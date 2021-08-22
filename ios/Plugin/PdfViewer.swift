import Foundation
import PDFKit
@objc public class PdfViewer: UIViewController, PDFViewDelegate {
    var pdfView: PDFView = PDFView()
    public override func viewDidLoad() {
        super.viewDidLoad()
        pdfView = PDFView()
        self.view.addSubview(pdfView)
    }

    @objc public func loadPDF(url: String) -> Void {
        guard let pdfURL = URL(string: url) else {
            print("Error: cannot create URL")
            return
        }
        var todosUrlRequest = URLRequest(url: pdfURL)
        todosUrlRequest.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: todosUrlRequest){
            (data, response, error)in
            guard let data = data else {
                return
            }
            do {
                print("base64 ------> ", data.base64EncodedString())
                // Approach 1
                // Load using PDFKit with data
                DispatchQueue.main.async {
                    //                pdfView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
                    //                pdfView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
                    //                pdfView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
                    //                pdfView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
                    self.pdfView.translatesAutoresizingMaskIntoConstraints = false
                    self.pdfView.autoScales = true
                    self.pdfView.displayMode = .singlePageContinuous
                    self.pdfView.displayDirection = .vertical
                    let doc = PDFDocument(data: data)
                    self.pdfView.document = doc
                }
                // Approach 2
                // load using contestsOf
                //                let tempData = try Data(contentsOf: pdfURL)
                //                    let binaryData = Data(base64Encoded: data.base64EncodedString())
                //
                // Approach 3
                // using webkit view
                //                self.webKitView.load(data.base64EncodedData(), mimeType: "application/pdf", characterEncodingName: "utf-8", baseURL: URL(fileURLWithPath: ""))
                // Approach 4
                // using base64
                //                let base64url = data.base64EncodedString()
                //                        .replacingOccurrences(of: "+", with: "-")
                //                        .replacingOccurrences(of: "/", with: "_")
                //                        .replacingOccurrences(of: "=", with: "")
                //                let finalUrl = URL(string: base64url)
                //                print("final ----", parsedData)
                // Approach 5
                // Using File manager
                //                var documentsURL = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last,
                //                            let convertedData = Data(base64Encoded: data.base64EncodedString())
                //                convertedData.write(to: documentsURL)
            }
            catch let err {
                print("Err", err)
            }
        }
        task.resume()
    }
}
