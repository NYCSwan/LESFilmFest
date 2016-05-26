require "rails_helper"

describe CommentsController do
  let!(:comment) { Comment.create!(body: "Comment", user_id: 1, review_id: 1) }

  describe "GET #new" do
    it 'assigns the new comment as @comment' do
      get 'new'
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "creates a new comment as @comment" do
        post 'create', {comment: {id: comment.id }}
        expect(assigns(:comment)).to be_an_instance_of(Comment)
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved comment as @comment" do
        post 'create', {comment: {id: comment.id}}
        expect(assigns(:comment)).to_not be_valid
      end

      it "re-renders the 'new' template" do
        post 'create', {comment: {id: comment.id}}
        response.should render_template(:new)
      end
    end
  end

end
