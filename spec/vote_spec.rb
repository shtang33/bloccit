describe Vote do 
  describe "validations" do
    
    describe "value validation" do
      it "only allows -1 or 1 as value" do 
        @post = Post.create(title: "post title", body: "post body")
        value = @post.vote.create(value: 1)
        expect(value).to eq(1)
      end
    end
  
  end
end