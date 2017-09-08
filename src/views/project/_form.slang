- if project.errors
  ul.errors
  - project.errors.each do |error|
    li = error.to_s

== form(action: "/projects/#{project.id.to_s}", method: project.id ? :patch : :post) do
  == csrf_tag
  div.form-group
  == text_field(name: "name", value: project.name, placeholder: "Name", class: "form-control")
  div.form-group
  == text_field(name: "description", value: project.description, placeholder: "Description", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/projects", class: "btn btn-default btn-xs")
