require "./spec_helper"

def create_subject
  subject = Project.new
  subject.name = "test"
  subject.save
  subject
end

describe ProjectController do
  Spec.before_each do
    Project.clear
  end

  describe "index" do
    it "renders all the projects" do
      subject = create_subject
      get "/projects"
      response.body.should contain "test"
    end
  end

  describe "show" do
    it "renders a single project" do
      subject = create_subject
      get "/projects/#{subject.id}"
      response.body.should contain "test"
    end
  end

  describe "new" do
    it "render new template" do
      get "/projects/new"
      response.body.should contain "New Project"
    end
  end

  describe "create" do
    it "creates a project" do
      post "/projects", body: "name=testing"
      subject_list = Project.all
      subject_list.size.should eq 1
    end
  end

  describe "edit" do
    it "renders edit template" do
      subject = create_subject
      get "/projects/#{subject.id}/edit"
      response.body.should contain "Edit Project"
    end
  end

  describe "update" do
    it "updates a project" do
      subject = create_subject
      patch "/projects/#{subject.id}", body: "name=test2"
      result = Project.find(subject.id).not_nil!
      result.name.should eq "test2"
    end
  end

  describe "delete" do
    it "deletes a project" do
      subject = create_subject
      delete "/projects/#{subject.id}"
      result = Project.find subject.id
      result.should eq nil
    end
  end
end
