require 'rails_helper'

RSpec.describe AnimesController, type: :request do

  let!(:anime) {create(:anime)}
  describe "GET /animes index" do
    let(:admin) {create(:admin, email: "foo@bar.com")}
    let(:reader) {create(:reader, email: "cge@run.com")}

    it 'allows access to non-users' do
      get animes_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(anime.title)
    end

    it 'should access if the user is a reader or admin' do
      sign_in reader
      get animes_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(anime.title)
      sign_out reader

      sign_in admin
      get animes_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(anime.title)
    end
  end

  describe "GET /anime/:id show" do
    let(:admin) {create(:admin, email: "foo@bar.com")}
    let(:reader) {create(:reader, email: "cge@run.com")}

    it 'allows access to non-users' do
      get anime_path(anime)
      expect(response).to have_http_status(200)
      expect(response.body).to include(anime.title)
    end

    it 'should access if the user is a reader or admin' do
      sign_in reader
      get anime_path(anime)
      expect(response).to have_http_status(200)
      expect(response.body).to include(anime.title)
      sign_out reader

      sign_in admin
      get anime_path(anime)
      expect(response).to have_http_status(200)
      expect(response.body).to include(anime.title)
    end
  end

  describe "GET /animes/new" do
    let(:admin) {create(:admin, role: :admin)}

    it 'should redirect to the other page if not login' do
      get new_anime_path
      expect(response).to have_http_status(302)
    end
  end

end