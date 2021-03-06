require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :title => "MyString",
      :content => "MyText",
      :start_year => 1,
      :end_year => 1,
      :location => "",
      :category => nil,
      :source => "MyString",
      :size => "MyString",
      :published => false
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "textarea#event_content[name=?]", "event[content]"

      assert_select "input#event_start_year[name=?]", "event[start_year]"

      assert_select "input#event_end_year[name=?]", "event[end_year]"

      assert_select "input#event_location[name=?]", "event[location]"

      assert_select "input#event_category_id[name=?]", "event[category_id]"

      assert_select "input#event_source[name=?]", "event[source]"

      assert_select "input#event_size[name=?]", "event[size]"

      assert_select "input#event_published[name=?]", "event[published]"
    end
  end
end
