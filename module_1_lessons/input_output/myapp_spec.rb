require_relative "myapp"

describe MyApp, "prompt_user" do
  before do
    @my_app = MyApp.new

    @input  = StringIO.new("ponies\n")
    @output = StringIO.new

    @my_app.input = @input
    @my_app.output = @output

    @user_selection = @my_app.prompt_user
  end

  it "should output the user's input" do
    @output.string.should =~ /ponies/
  end

  it "should return the user's selection" do
    @user_selection.should == "ponies"
  end
end
