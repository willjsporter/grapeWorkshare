require_relative '../../app'
require_relative './helpers/formhelper'

feature 'A user can get the time' do
  # def app
  #   InterviewApp
  # end

  scenario 'A user visits /gettime' do
    # Timecop.freeze(Time.now)
    test_content = { time: Time.now }.to_json
    visit '/gettime'
    expect(page).to have_content(test_content)
  end
  # Timecop.return

  scenario 'A user can get an amended time (from user input)' do
    test_time = { time: Time.new(2017, 12, 3, 0o5, 59, 59) }.to_json
    visit '/settime'
    input_time
    expect(page.status_code).to eq 200
    expect(page).to have_content(test_time)
  end

  scenario 'A user can get an amended time (from user input)' do
    test_time = { time: Time.new(2017, 12, 03, 05, 59, 59) }.to_json
    visit '/settime'
    input_time
    visit '/gettime'
    expect(page).to have_content(test_time)
  end
end
