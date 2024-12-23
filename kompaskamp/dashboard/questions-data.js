const questionSets = {
    riasec: {
        realistic: [
            {
                id: 'R1',
                text: 'Saya suka bekerja dengan peralatan dan mesin',
                category: 'realistic'
            },
            {
                id: 'R2',
                text: 'Saya lebih suka aktivitas fisik dan praktik',
                category: 'realistic'
            }
            // Add more realistic questions
        ],
        investigative: [
            {
                id: 'I1',
                text: 'Saya suka memecahkan masalah kompleks',
                category: 'investigative'
            },
            {
                id: 'I2',
                text: 'Saya tertarik pada penelitian ilmiah',
                category: 'investigative'
            }
            // Add more investigative questions
        ]
        // Add other RIASEC categories
    },
    
    multipleIntelligence: {
        logical: [
            {
                id: 'L1',
                text: 'Saya suka bermain dengan angka dan perhitungan',
                category: 'logical'
            }
            // Add more logical questions
        ],
        linguistic: [
            {
                id: 'V1',
                text: 'Saya pandai bermain kata dan menulis',
                category: 'linguistic'
            }
            // Add more linguistic questions
        ]
        // Add other MI categories
    }
};

// Scoring functions
const calculateRIASECScore = (answers) => {
    // Implement RIASEC scoring logic
};

const calculateMIScore = (answers) => {
    // Implement Multiple Intelligence scoring logic
};

// Export the data and functions
export {
    questionSets,
    calculateRIASECScore,
    calculateMIScore
};
