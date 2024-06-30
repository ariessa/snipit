import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu"];

  openMenu() {
    this.menuTarget.style.display = 'block';
  }

  closeMenu() {
    this.menuTarget.style.display = 'none';
  }
}
