// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import { initFlowbite } from "flowbite";
import AOS from "aos";
import "aos/dist/aos.css";

// Number Counter Animation
function animateCounter(element) {
  const target = parseInt(element.getAttribute('data-target'));
  const duration = 2000; // 2 seconds
  const increment = target / (duration / 16); // 60fps
  let current = 0;
  
  const updateCounter = () => {
    current += increment;
    if (current < target) {
      element.textContent = Math.floor(current);
      requestAnimationFrame(updateCounter);
    } else {
      element.textContent = target;
    }
  };
  
  updateCounter();
}

// Intersection Observer for counters
function initCounters() {
  const counters = document.querySelectorAll('.counter-number');
  
  if (counters.length === 0) return;
  
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting && !entry.target.classList.contains('counted')) {
        entry.target.classList.add('counted');
        animateCounter(entry.target);
      }
    });
  }, { threshold: 0.5 });
  
  counters.forEach(counter => observer.observe(counter));
}

// Page transitions
document.addEventListener("turbo:before-render", (event) => {
  event.detail.newBody.classList.add('page-transition');
});

// Initialize on page load
document.addEventListener("turbo:load", () => {
  AOS.init({ 
    duration: 700, 
    once: true, 
    easing: "ease-out-quart",
    offset: 50
  });
  initFlowbite();
  initCounters();
});

document.addEventListener("turbo:render", () => {
  initFlowbite();
  initCounters();
});