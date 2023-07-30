import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["loading", "textField", "submitButton"];

  start_submit() {
    this.textFieldTarget.disabled = true;
    this.loadingTarget.hidden = false;
  }

  reset() {
    this.element.reset();

    this.textFieldTarget.disabled = false;
    this.loadingTarget.hidden = true;
  }
}