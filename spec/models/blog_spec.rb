require 'spec_helper'

describe Blog do

	let(:user) { FactoryGirl.create(:user) }
	before { @blog = user.blogs.build(content: "Lorem ipsum") }

	subject { @blog }

	it { should respond_to(:content) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user)    }
	its(:user) { should eq user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @blog.user_id = nil }
		it { should_not be_valid }
	end

	describe "with blank content" do
		before { @blog.content = " " }
		it { should_not be_valid }
	end

	describe "with content that is too short" do
		before { @blog.content = "a"*9 }
		it { should_not be_valid }
	end
end
