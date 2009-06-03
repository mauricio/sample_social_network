# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def flash_message
    messages = []
    [:notice, :info, :warning, :error].each do|type|
      if flash[type]
        messages << content_tag( :div, flash[type], :id => type )
      end
    end
    messages.join("\n")
  end

  def partial( name, locals = {} )
    render :partial => name.to_s, :locals => locals
  end

  def page_title
    @page_title || "Sample Social Network"
  end

  # Create tab.
  #
  # The tab will link to the first options hash in the all_options array,
  # and make it the current tab if the current url is any of the options
  # in the same array.
  #
  # +name+ specifies the name of the tab
  # +all_options+ is an array of hashes, where the first hash of the array is the tab's link and all others will make the tab show up as current.
  #
  # If now options are specified, the tab will point to '#', and will never have the 'active' state.
  def tab_to(name, all_options = nil)
    url = all_options.is_a?(Array) ? all_options[0].merge({:only_path => false}) : "#"

    current_url = url_for(:action => @current_action, :only_path => false)
    html_options = {}

    if all_options.is_a?(Array)
      all_options.each do |o|
        if url_for(o.merge({:only_path => false})) == current_url
          html_options = {:class => "current"}
          break
        end
      end
    end

    link_to(name, url, html_options)
  end

end
