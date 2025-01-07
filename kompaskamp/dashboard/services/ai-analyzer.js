class AIAnalyzer {
    constructor() {
        this.API_URL = 'http://195.179.229.119/gpt/api.php';
        this.API_KEY = 'your-email@domain.com'; // Ganti dengan email Anda
    }

    async analyzeResponses(answers) {
        try {
            const prompt = `Analyze these career assessment responses and provide recommendations:
                ${JSON.stringify(answers)}
                
                Provide analysis in this JSON format:
                {
                    "personalityType": {
                        "title": "string",
                        "description": "string",
                        "traits": ["trait1", "trait2", "trait3"]
                    },
                    "recommendations": {
                        "programs": [
                            {
                                "name": "string",
                                "match": number,
                                "reason": "string"
                            }
                        ]
                    }
                }`;

            const response = await fetch(`${this.API_URL}?${new URLSearchParams({
                prompt: prompt,
                api_key: this.API_KEY,
                model: 'gpt-3.5-turbo'
            })}`);

            if (!response.ok) throw new Error('Analysis failed');

            const result = await response.json();
            return JSON.parse(result);
        } catch (error) {
            console.error('AI Analysis failed:', error);
            return this.getFallbackAnalysis();
        }
    }

    getFallbackAnalysis() {
        // Analisis fallback jika AI gagal
        return {
            personalityType: {
                title: "The Analyst",
                description: "Pendekatan sistematis dalam pemecahan masalah",
                traits: ["Analytical", "Logical", "Systematic"]
            },
            // ... rest of fallback data
        };
    }
}

window.aiAnalyzer = new AIAnalyzer();
