module UsersHelper

  def model_fields
    # which fields to display and sort by
    ['email', 'name', 'surname', 'age', 'gender.name', 'skill_level.full_name', 'city.name', 'tennis_club.full_name', 'tennis_court.full_name', 'actions']
  end

  def results_limit
    # max number of search results to display
    1000
  end

  def display_query_sql(users)
    "SQL: #{users.to_sql}"
  end

  def display_results_header(count)
    if count > results_limit
      "First #{results_limit} results out of #{count} total"
    else
      "#{pluralize(count, 'result')}"
    end
  end

  def action
    action_name == 'advanced_search' ? :post : :get
  end

  def display_sort_column_headers(search)
    model_fields.each_with_object('') do |field, string|
      field_split = field.split(".")
      header_name = field_split[0].capitalize
      sort_name = ""
      if field_split.length == 1
        sort_name = field_split[0]
      else
        sort_name = "#{field_split[0]}_name"
      end
      string << content_tag(:th, sort_link(search, sort_name, header_name, {}, method: action))
    end
  end

  def display_search_results(objects)
    objects.limit(results_limit).each_with_object('') do |object, string|
      string << content_tag(:tr, display_search_results_row(object))
    end
  end

  def display_search_results_row(object)
    model_fields.each_with_object('') do |field, string|
      field_split = field.split(".")
      object_data = ""
      if field_split.length == 1
        if field_split[0] == "profile_picture"
          object_data = image_tag(object.send(field_split[0]).to_s)
        elsif field_split[0] == "actions"
          object_data = link_to("Show", object)
          object_data += content_tag(:span, " | ")
          object_data += link_to("Rate", new_rating_path(:receiver_id => object.send(:id)))
          object_data += content_tag(:span, " | ")
          object_data += link_to("Message", new_message_path(:receiver_id => object.send(:id)))
        else
          object_data = object.send(field_split[0])
        end
      elsif field_split.length == 2
        obj = object.send(field_split[0])
        if obj
          object_data = link_to(obj.send(field_split[1]), obj)
        else
          object_data = "Not selected"
        end
      elsif field_split.length == 3
        object.send(field_split[0]).each do |obj|
          object_data += obj.send(field_split[2]) + "\n"
        end
      end
      string << content_tag(:td, object_data)
    end
    .html_safe
  end

end
