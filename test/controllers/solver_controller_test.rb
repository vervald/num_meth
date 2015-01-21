require 'test_helper'

class SolverControllerTest < ActionController::TestCase
  test "lolka" do
    get(:do_adams,
        {:init_x => 2, :init_y => 4, :id => 1, :from => 2, :to => 4,
         :func => '2*x'})
    assert true
  end
  # test "the truth" do
  #   assert true
  # end
end
