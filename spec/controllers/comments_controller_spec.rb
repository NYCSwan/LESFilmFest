require "rails_helper"

describe CommentsController do
  let!(:comment) { Comment.create!(text: "Comment", user: 1, review: 1) }

  describe "GET #new" do
    it 'assigns the new comment as @comment' do
      get 'new'
      expect(assigns(:comment)).to eq(comment)
    end

   describe "GET #show" do
    it "assigns the requested comment as @comment" do
      get :show, { id: comment.id }
      expect(assigns(:comment)).to eq(comment)
    end
  end


end
