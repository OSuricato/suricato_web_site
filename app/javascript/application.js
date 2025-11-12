// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "flowbite";
import AOS from "aos";
import "aos/dist/aos.css";

document.addEventListener("turbo:load", () => {
  AOS.init({ duration: 700, once: true, easing: "ease-out-quart" });
});