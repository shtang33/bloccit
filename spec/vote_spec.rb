require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        user = User.create
        topic = Topic.create
        @post = Post.create(title: "post title", body: "post body")
        value = @post.votes.create(value: 1)
        expect(value).to eq(1)
      end
    end
  end
end