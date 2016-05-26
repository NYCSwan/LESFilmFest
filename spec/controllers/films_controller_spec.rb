require "rails_helper"

describe FilmsController do
  let!(:film) { Film.create!(title:"Back to the Future", description:"Best Ever", writers: "No idea", actors: "MJ Fox", category_id: 10, director: "Does it matter") }

  describe "GET #index" do
    it 'assigns all films @films' do
      get 'index'
      expect(assigns(:films)).to eq([film])
    end
  end

   describe "GET #show" do
    it "assigns the requested film as @film" do
      get :show, { id: film.id }
      expect(assigns(:film)).to eq(film)
    end
  end


end
