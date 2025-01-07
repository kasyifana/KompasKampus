class PDFService {
    async generatePDF(data) {
        const element = document.getElementById('report-section');
        
        const opt = {
            margin: 1,
            filename: 'career-assessment-report.pdf',
            image: { type: 'jpeg', quality: 0.98 },
            html2canvas: { scale: 2 },
            jsPDF: { unit: 'in', format: 'a4', orientation: 'portrait' }
        };

        // Use html2pdf
        html2pdf().set(opt).from(element).save();
    }
}

window.pdfService = new PDFService();
