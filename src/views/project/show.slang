p = project.name
p = project.description
p
  a.btn.btn-default.btn-xs href="/projects" back
  a.btn.btn-success.btn-xs href="/projects/#{ project.id }/edit" edit
  a.btn.btn-danger.btn-xs href="/projects/#{ project.id }?_method=delete" onclick="return confirm('Are you sure?');" delete
