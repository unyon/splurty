require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
   test "quotes show page" do
   	    quote = Quote.create(author: 'Ken Mazaika', saying: 'You only yolo once.')
   	    get :show, id: quote.id
   	    assert_response :success
   end

   test "quotes show page, not found" do
   	    get :show, id: 'OMG'
   	    assert_response :not_found
   end


end
