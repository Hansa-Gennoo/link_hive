import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static targets = ["list"]

  connect() {
    this.sortable = Sortable.create(this.listTarget, {
      animation: 150,
      onEnd: this.updateOrder.bind(this)
    })
  }

  updateOrder(event) {
    const ids = Array.from(this.listTarget.children).map(
      li => li.dataset.id
    )

    fetch("/dashboard/links/reorder", {
      method: "PATCH",
      headers: { "Content-Type": "application/json", "X-CSRF-Token": document.querySelector("[name='csrf-token']").content },
      body: JSON.stringify({ ids: ids })
    })
  }
}
