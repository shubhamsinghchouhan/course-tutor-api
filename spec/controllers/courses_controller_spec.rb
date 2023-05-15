require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "POST create" do
    context "with valid parameters" do
      it "creates a new course and tutor" do
        expect {
          post :create, params: { course: { name: "Math", tutors_attributes: [{ name: "John" }] } }
        }.to change { Course.count }.by(1).and change { Tutor.count }.by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "returns errors" do
        post :create, params: { course: { name: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body).to include("name" => ["can't be blank"])
      end
    end
  end

  describe "GET index" do
    it "returns a list of courses with their tutors" do
      math = Course.create(name: "Math")
      john = Tutor.create(name: "John", course: math)
      jane = Tutor.create(name: "Jane", course: math)

      get :index
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body).to match_array([
        { "id" => math.id, "name" => "Math", "created_at"=>anything, "updated_at"=>anything, "tutors" => [
          { "id" => john.id, "name" => "John", "course_id" => math.id, "created_at"=>anything,
            "updated_at"=>anything },
          { "id" => jane.id, "name" => "Jane", "course_id" => math.id, "created_at"=>anything,
            "updated_at"=>anything }
        ] }
      ])
    end
  end
end


