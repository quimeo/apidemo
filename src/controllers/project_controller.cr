class ProjectController < ApplicationController
  def index
    projects = Project.all
    jrender_m(projects)
    # render("index.slang")
  end

  def show
    if project = Project.find params["id"]
      jrender_o(project)
      # render("show.slang")
    else
      flash["warning"] = "Project with ID #{params["id"]} Not Found"
      redirect_to "/projects"
    end
  end

  def new
    project = Project.new
    render("new.slang")
  end

  def create
    project = Project.new(params.to_h.select(["name", "description"]))

    if project.valid? && project.save
      flash["success"] = "Created Project successfully."
      redirect_to "/projects"
    else
      flash["danger"] = "Could not create Project!"
      render("new.slang")
    end
  end

  def edit
    if project = Project.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Project with ID #{params["id"]} Not Found"
      redirect_to "/projects"
    end
  end

  def update
    if project = Project.find(params["id"])
      project.set_attributes(params.to_h.select(["name", "description"]))
      if project.valid? && project.save
        flash["success"] = "Updated Project successfully."
        redirect_to "/projects"
      else
        flash["danger"] = "Could not update Project!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Project with ID #{params["id"]} Not Found"
      redirect_to "/projects"
    end
  end

  def destroy
    if project = Project.find params["id"]
      project.destroy
    else
      flash["warning"] = "Project with ID #{params["id"]} Not Found"
    end
    redirect_to "/projects"
  end
end
