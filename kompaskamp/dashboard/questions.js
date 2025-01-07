const assessmentQuestions = [
    {
        id: 1,
        text: "Ketika menghadapi masalah kompleks, saya cenderung:",
        theme: "problem_solving",
        type: "personality",
        icon: "fa-lightbulb",
        bgColor: "bg-blue-100",
        options: [
            { id: 'a1', text: "Menganalisis secara sistematis dan terstruktur", traits: { analytical: 5, methodical: 4 } },
            { id: 'a2', text: "Mencari solusi kreatif dan inovatif", traits: { creative: 5, innovative: 4 } },
            { id: 'a3', text: "Berdiskusi dengan orang lain untuk solusi kolaboratif", traits: { social: 5, collaborative: 4 } },
            { id: 'a4', text: "Menggunakan intuisi dan pengalaman", traits: { intuitive: 5, practical: 4 } }
        ]
    },
    {
        id: 2,
        text: "Dalam situasi pembelajaran, saya paling efektif ketika:",
        theme: "learning_style",
        type: "preference",
        icon: "fa-book-open",
        bgColor: "bg-purple-100",
        options: [
            { id: 'b1', text: "Mempraktikkan langsung materi yang dipelajari", traits: { practical: 5, hands_on: 4 } },
            { id: 'b2', text: "Menganalisis teori dan konsep secara mendalam", traits: { theoretical: 5, analytical: 4 } },
            { id: 'b3', text: "Berdiskusi dan bertukar pikiran dalam kelompok", traits: { social: 5, verbal: 4 } },
            { id: 'b4', text: "Mengeksplorasi ide-ide baru secara mandiri", traits: { independent: 5, creative: 4 } }
        ]
    },
    // ... tambahkan 13 soal lagi dengan format yang sama
];

// Export questions
window.assessmentQuestions = assessmentQuestions;
