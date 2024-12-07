function toggle_menus(elementId, id, cssClass) {
  let element = document.getElementById(elementId);
  element.addEventListener("click", function(event) {
    event.preventDefault();
    let selected_menu = document.getElementById(id);
    selected_menu.classList.toggle(cssClass);
  });
}

document.addEventListener("turbo:load", function() {
  toggle_menus("hamburger", "navbar-menu", "collapse");
  toggle_menus("account", "dropdown-menu", "active");
});