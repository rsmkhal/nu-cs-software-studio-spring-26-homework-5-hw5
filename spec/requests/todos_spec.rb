require "rails_helper"

RSpec.describe "Todos index filtering", type: :request do
  it "filters todos by category param" do
    Todo.create!(description: "Write report", category: "work")
    Todo.create!(description: "Read chapter 3", category: "study")

    get todos_path, params: { category: "work" }

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Write report")
    expect(response.body).not_to include("Read chapter 3")
  end

  it "shows todos from every category when no filter is given" do
    Todo.create!(description: "Write report", category: "work")
    Todo.create!(description: "Read chapter 3", category: "study")

    get todos_path

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Write report")
    expect(response.body).to include("Read chapter 3")
  end
end
