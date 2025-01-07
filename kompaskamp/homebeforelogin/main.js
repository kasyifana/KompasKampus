// Initialize AOS
AOS.init({
    duration: 800,
    offset: 100,
    once: true
});

// Mobile menu toggle
const menuToggle = document.querySelector('.menu-toggle');
const navLinks = document.querySelector('.nav-links');

menuToggle?.addEventListener('click', () => {
    navLinks?.classList.toggle('active');
});

// Modal functionality
function setupModal(triggerSelector, modalId) {
    const triggers = document.querySelectorAll(triggerSelector);
    const modal = document.getElementById(modalId);
    
    triggers.forEach(trigger => {
        trigger.addEventListener('click', () => {
            modal.style.display = 'flex';
        });
    });

    modal?.addEventListener('click', (e) => {
        if (e.target === modal) {
            modal.style.display = 'none';
        }
    });
}

// Load modals
fetch('components/modals.html')
    .then(response => response.text())
    .then(html => {
        document.getElementById('modalContainer').innerHTML = html;
        // Setup login and register modals after loading
        setupModal('[data-modal="login"]', 'loginModal');
        setupModal('[data-modal="register"]', 'registerModal');
    });

// Smooth scroll
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href'))?.scrollIntoView({
            behavior: 'smooth'
        });
    });
});

// Intersection Observer for scroll animations
const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('animate-fadeInUp');
        }
    });
}, {
    threshold: 0.1
});

document.querySelectorAll('[data-aos]').forEach((element) => {
    observer.observe(element);
});