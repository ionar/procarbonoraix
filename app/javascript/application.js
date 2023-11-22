// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// console.log("Log do application.js works")

function checkMediaQuery() {
    const desktopContainer = document.getElementById("form-inscricao");
    const formulario = document.getElementById("formulario");
    const celularContainer = document.getElementById("form-celular");
    // If the inner width of the window is greater then 768px
    if (window.innerWidth < 992) {
      // Then log this message to the console
      celularContainer.appendChild(formulario);
    } else {
        desktopContainer.appendChild(formulario)
    }
}
  // Add a listener for when the window resizes
  window.addEventListener('load', checkMediaQuery);
  //window.addEventListener('resize', checkMediaQuery);

