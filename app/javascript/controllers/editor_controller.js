// app/javascript/controllers/editor_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "editableField", "displayField"]

  connect() {
    this.editMode = false
  }

  toggle() {
    this.editMode = !this.editMode
    this.updateUI()
  }

  updateUI() {
    this.editableFieldTargets.forEach(el => el.hidden = !this.editMode)
    this.displayFieldTargets.forEach(el => el.hidden = this.editMode)

    // Change button text dynamically
    const toggleButton = document.querySelector(".btn-toggle")
    if (toggleButton) {
      toggleButton.textContent = this.editMode ? "Exit Edit Mode" : "Edit Mode"
    }
  }

  submitForm(event) {
    // Optional: prevent default, let Rails handle submission
    // event.preventDefault()
  }
}

