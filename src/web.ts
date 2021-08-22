import { WebPlugin } from '@capacitor/core';

import type { PdfViewerPlugin } from './definitions';

export class PdfViewerWeb extends WebPlugin implements PdfViewerPlugin {

  async loadPDF({ url }: { url: string }): Promise<void> {
    window.open(url);
  }
}
