const assessmentQuestions = {
    questions: [
        {
            id: 1,
            text: "Bagaimana cara Anda menyelesaikan masalah kompleks?",
            type: "single",
            options: [
                { text: "Menganalisis secara sistematis dan terstruktur", score: { analytical: 5, methodical: 4 } },
                { text: "Mencoba berbagai pendekatan kreatif", score: { creative: 5, innovative: 4 } },
                { text: "Berdiskusi dan mencari masukan dari orang lain", score: { collaborative: 5, social: 4 } },
                { text: "Mengandalkan intuisi dan pengalaman", score: { intuitive: 5, practical: 4 } }
            ]
        },
        {
            id: 2,
            text: "Dalam situasi kerja kelompok, posisi apa yang Anda sukai?",
            type: "single",
            options: [
                { text: "Pemimpin yang mengarahkan tim", score: { leadership: 5, decisive: 4 } },
                { text: "Perencana yang menyusun strategi", score: { strategic: 5, analytical: 4 } },
                { text: "Mediator yang menyelaraskan tim", score: { diplomatic: 5, social: 4 } },
                { text: "Eksekutor yang menyelesaikan tugas", score: { practical: 5, reliable: 4 } }
            ]
        },
        // ... 13 more questions with similar structure
    ]
};

class QuestionService {
    constructor() {
        this.currentIndex = 0;
        this.questions = assessmentQuestions.questions;
    }

    getCurrentQuestion() {
        return this.questions[this.currentIndex];
    }

    getNextQuestion() {
        if (this.currentIndex < this.questions.length - 1) {
            this.currentIndex++;
            return this.questions[this.currentIndex];
        }
        return null;
    }

    getPreviousQuestion() {
        if (this.currentIndex > 0) {
            this.currentIndex--;
            return this.questions[this.currentIndex];
        }
        return null;
    }

    getTotalQuestions() {
        return this.questions.length;
    }
}
