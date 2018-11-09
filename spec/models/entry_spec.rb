require 'rails_helper'

describe Entry do
  describe "scope" do
    describe "partial_match_with_title" do

      let!(:entry_aiueo) { create(:entry, title: "aiueo") }
      let!(:entry_kakikukeko) { create(:entry, title: "kakikukeko") }

      it "部分一致検索できること" do
        entries = Entry.partial_match_with_title("iu").all
        expect(entries).to match_array [entry_aiueo]
      end
      
    end
  end
end
