describe App do

  describe 'GET /' do

    it 'sends a 200 status code' do
      get '/'
      expect(last_response.status).to eq(200)
    end

    it 'renders welcome' do
      visit '/'
      expect(page).to have_link("Click Here To List A Puppy")
    end
  end

  describe 'GET /NEW' do
    it 'sends a 200 status code' do
      get '/new'
      expect(last_response.status).to eq(200)
    end

    it 'renders the form' do
      visit '/new'
      expect(page).to have_selector("form")
      expect(page).to have_field(:name)
      expect(page).to have_field(:breed)
      expect(page).to have_field(:age)
    end
  end

  describe 'POST /' do
    it "displays the puppy" do
      visit '/new'

      fill_in(:name, :with => "Butch")
      fill_in(:breed, :with => "Mastiff")
      fill_in(:age, :with => "6 months")
      click_button "submit"

      expect(page.status_code).to eq(200)

      # The \s below will match any whitespace
      expect(page).to have_text(/Name:\s+Butch/i)
      expect(page).to have_text(/Breed:\s+Mastiff/i)
      expect(page).to have_text(/Age:\s+6 months/i)
    end
  end


end
