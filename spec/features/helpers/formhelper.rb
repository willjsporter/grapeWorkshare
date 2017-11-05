def input_time
  fill_in('year', with: 2017)
  fill_in('month', with: 12)
  fill_in('day', with: 03)
  fill_in('hour', with: 05)
  fill_in('minute', with: 59)
  fill_in('second', with: 59)
  click_button('click!')
end
