module DashboardHelper
  # Returns a valid link for adding a link, or nil if no landing page is set
  def add_link_button(landing_page)
    return unless landing_page

    link_to "Add Link", new_dashboard_landing_page_link_path(landing_page), class: "btn"
  end
end
