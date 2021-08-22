export interface PdfViewerPlugin {
  loadPDF(options: { url: string }): Promise<void>;
}
