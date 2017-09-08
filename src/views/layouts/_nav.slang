- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/projects" ? "active" : ""
a class="nav-item #{active}" href="/projects" Projects
