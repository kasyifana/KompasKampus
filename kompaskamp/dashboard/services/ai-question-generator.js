class AIQuestionGenerator {
    constructor() {
        this.API_URL = 'http://195.179.229.119/gpt/api.php';
        this.API_KEY = 'your-email@domain.com'; // Ganti dengan email Anda
    }

    async generateQuestions() {
        try {
            const prompt = `Generate 15 personality assessment questions in JSON format with this structure:
            {
                "questions": [
                    {
                        "id": number,
                        "text": "question text",
                        "options": [
                            {
                                "id": "string",
                                "text": "option text",
                                "traits": {
                                    "traitName": number (1-5)
                                }
                            }
                        ]
                    }
                ]
            }
            
            Make questions varied and focused on career assessment. Use Bahasa Indonesia.`;

            const response = await fetch(`${this.API_URL}?${new URLSearchParams({
                prompt: prompt,
                api_key: this.API_KEY,
                model: 'gpt-3.5-turbo'
            })}`);

            if (!response.ok) {
                throw new Error('Failed to generate questions');
            }

            const data = await response.json();
            const questions = JSON.parse(data.choices[0].message.content);
            return questions.questions;
        } catch (error) {
            console.error('Question generation failed:', error);
            return this.getFallbackQuestions();
        }
    }

    getFallbackQuestions() {
        return [
            {
                id: 1,
                text: "Bagaimana cara Anda menyelesaikan masalah kompleks?",
                options: [
                    { id: 'a1', text: "Menganalisis secara sistematis", traits: { analytical: 5, methodical: 4 } },
                    { id: 'a2', text: "Mencari solusi kreatif", traits: { creative: 5, innovative: 4 } },
                    { id: 'a3', text: "Berdiskusi dengan orang lain", traits: { social: 5, collaborative: 4 } }
                ]
            },
            // ... more fallback questions
        ];
    }
}
