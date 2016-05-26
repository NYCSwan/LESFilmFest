require "rails_helper"

describe ReviewsController do
  let!(:review) { Review.create!(title: "Review", body: "review", star_value: 3.0, user_id: 1, film_id: 1) }

  describe "GET #new" do
    it 'assigns the new review as @review' do
      get 'new'
      expect(assigns(:review)).to be_a_new(Review)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "creates a new review as @review" do
        post 'create', {review: {id: review.id }}
        expect(assigns(:review)).to be_an_instance_of(Review)
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved review as @review" do
        post 'create', {review: {id: review.id}}
        expect(assigns(:review)).to_not be_valid
      end

      it "re-renders the 'new' template" do
        post 'create', {review: {id: review.id}}
        response.should render_template(:new)
      end
    end
  end

end
