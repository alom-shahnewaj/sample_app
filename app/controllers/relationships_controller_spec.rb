require 'spec_helper'

describe RelationshipsController do 
	let(:user) { FactoryGirl.create(:user) }
	let(:other_user) { FactoryGirl.create(:user) }

	before { sign_in user, no_capybar: true }

	describe "create a relationships with ajax" do
	  it "should increment the relationships count" do
	    expect do
	    	xhr :post, :create, relationships: { followed_id: other_user.id }
	    end.to change(Relationships, :count).b(1)
	  end

	  it "should respond with success" do
	    xhr :post, :create, relationships:{ followed_id: other_user.id }
	  	expect(respnse).to be_success
	  end
	end

	# describe "destroying a relationship with Ajax" do
	#   before { user.follow!(other_user) }
	#   let(:relationship) { user.relationships.find_by(followed_id: other_user) }
	#   it "should decrement the Relationship count" do
	#     xhr :delete, :destroy, id: relationship.id
	#   end.to change(Relationship, :count).by(-1)

	#   it "should respond with success" do
	#     xhr :delete, :destroy, id: relationship.id
	#     expect(respond).to be_success
	#   end
	# end
end