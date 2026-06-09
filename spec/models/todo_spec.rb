require "rails_helper"

RSpec.describe Todo, type: :model do
  describe ".with_category" do
    it "returns only todos in the selected category" do
      work_todo = Todo.create!(description: "Write report", category: "work")
      study_todo = Todo.create!(description: "Read chapter 3", category: "study")

      result = Todo.with_category("work")

      expect(result).to include(work_todo)
      expect(result).not_to include(study_todo)
    end

    it "returns all todos when no category is selected" do
      work_todo = Todo.create!(description: "Write report", category: "work")
      study_todo = Todo.create!(description: "Read chapter 3", category: "study")

      expect(Todo.with_category(nil)).to include(work_todo, study_todo)
      expect(Todo.with_category("")).to include(work_todo, study_todo)
    end
  end
end
