import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["openMenu", "closeMenu", "leftMenu"];

    toggleMenu(){
       let left_menu = this.leftMenuTarget

        if (left_menu.dataset.hidden === "true") {
            left_menu.style.display = "none";
            left_menu.dataset.hidden = "false"
            this.openMenuTarget.classList.remove("hidden");
        } else {
            // we did not give block because we use tailwind and the element has a display style
            left_menu.style.display = "";
            left_menu.dataset.hidden = "true"
            this.openMenuTarget.classList.add("hidden");
        }
    }
}
