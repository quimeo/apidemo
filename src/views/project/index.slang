div.row
  div.col-sm-11
    h2 Projects
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/projects/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Description
        th Actions
    tbody
    - projects.each do |project|
      tr
        td = project.name
        td = project.description
        td
          span
            a.btn.btn-primary.btn-xs href="/projects/#{ project.id }" read
            a.btn.btn-success.btn-xs href="/projects/#{ project.id }/edit" edit
            a.btn.btn-danger.btn-xs href="/projects/#{ project.id }?_method=delete" onclick="return confirm('Are you sure?');" delete

