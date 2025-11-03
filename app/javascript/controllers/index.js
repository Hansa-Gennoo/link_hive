// app/javascript/controllers/index.js
import { application } from "./application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import EditorController from "./editor_controller"

// Auto-load all controllers in this folder
eagerLoadControllersFrom("controllers", application)

// Register EditorController manually
application.register("editor", EditorController)

// Optional: attach to window for debugging
window.Stimulus = application

