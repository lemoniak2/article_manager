require 'rails_helper'
describe ArticlesController do
  login_admin

  it 'should have a current_user' do
    subject.current_user.should_not be_nil
  end

  describe 'get index' do
    it 'should get index' do
      get 'index'
      response.should be_success
    end
  end

  describe 'GET #show' do
    it 'assigns the requested article to @article' do
      article = create(:article)
      get :show, id: article.id
      assigns(:article).should eq(article)
    end

    it 'renders the #show view' do
      get :show, id: create(:article)
      response.should render_template :show
    end
  end

  it 'creates a new article' do
    expect{ post :create, article: attributes_for(:article) }.to change{Article.count}.by 1
  end

  describe 'PUT update' do
    before :each do
      @article = create(:article, title: 'How to find and kill thiefs', summary: 'Short')
    end

    it 'located the requested @article' do
      put :update, id: @article, article: attributes_for(:article)
      assigns(:article).should eq(@article)
    end

    it 'changes @articles attributes' do
      put :update, id: @article, article: attributes_for(:article, title: 'How to find and kill niggers', summary: 'Long')
      @article.reload
      @article.title.should eq('How to find and kill niggers')
      @article.summary.should eq('Long')
    end
  end
end