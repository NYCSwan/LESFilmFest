require "rails_helper"

describe CategoriesController do
  let!(:category) { Category.create!(name: 'Drama')}

  describe "GET #index" do
    it 'assigns all categories @categories' do
      get 'index'
      expect(assigns(:categories)).to eq([category])
    end
  end

   describe "GET #show" do
    it "assigns the requested category as @category" do
      get :show, { id: category.id }
      expect(assigns(:category)).to eq(category)
    end

    it 'assigns the requested films as @category_films'










end
