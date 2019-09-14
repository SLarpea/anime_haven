require 'rails_helper'

RSpec.describe GenresController, type: :request do
  let!(:genre) {create(:genre)}
  describe "GET /genres" do
    let(:reader) {create(:reader, email: 'foo@bar.com')}
    let(:admin) {create(:admin, email: 'bernard@example.com')}

    it 'allows access to non-users' do
      #genre = create(:genre)
      get genres_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(genre.genre_name)
    end

    it 'should access if the user is a reader or admin' do
      # genre = create(:genre)
      sign_in reader
      get genres_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(genre.genre_name)
      sign_out reader

      sign_in admin
      get genres_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(genre.genre_name)
    end
  end
end