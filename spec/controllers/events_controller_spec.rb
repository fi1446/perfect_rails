require 'rails_helper'

describe EventsController do
  describe "GET #new" do
    context "未ログインユーザがアクセスしたとき" do
      before {get :new}
      it "トップページにリダイレクトすること" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "ログインユーザー" do
      before do
        user = create :user
        session[:user_id] = user.id
        get :new
      end
    end

    it "ステータスコードとして200が返ること" do
      expect(response.status).to eq(200)
    end

    it '@eventに新規Eventオブジェクトが格納されていること' do
      expect(assigns(:event)).to be_a_new(Event)
    end

    it 'newテンプレートをrenderしていること' do
      expect(response).to render_template :new
    end

  end
end
