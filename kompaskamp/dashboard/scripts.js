document.addEventListener('DOMContentLoaded', function() {
    // Add smooth scroll behavior
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Add notification system
    const showNotification = (message, type = 'info') => {
        const notification = document.createElement('div');
        notification.className = `fixed bottom-4 right-4 p-4 rounded-lg shadow-lg ${
            type === 'success' ? 'bg-green-500' : 
            type === 'error' ? 'bg-red-500' : 
            'bg-blue-500'
        } text-white z-50 animate-fade-in`;
        notification.innerHTML = message;
        document.body.appendChild(notification);
        
        setTimeout(() => {
            notification.remove();
        }, 3000);
    };

    // Add progress tracking
    const updateProgress = () => {
        const progress = {
            assessments: {
                completed: 1,
                total: 3
            },
            practice: {
                completed: 24,
                total: 30
            }
        };

        // Update progress bars and stats
        document.querySelectorAll('[data-progress]').forEach(el => {
            const type = el.dataset.progress;
            const prog = progress[type];
            if (prog) {
                el.style.width = `${(prog.completed / prog.total) * 100}%`;
            }
        });
    };

    // Initialize features
    updateProgress();
});
