module TodosHelper
  def hide_or_show_footer
    # Hide footer if no more todos are left
    if Todo.count == 0
      "$('#footer').hide();".html_safe
    else
      "$('#footer').show();".html_safe
    end
  end
end

