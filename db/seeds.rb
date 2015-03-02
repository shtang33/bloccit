 require 'faker'
 
 if Post.find_by(title:"A test Post", body:"blah blah blah") == nil
   Post.create!(
   title: "A test Post",
   body: "blah blah blah" 
  )
   p = self
 end

 if Comment.where(body:"Test comment!").count == 0
   p.comments.create(body:"Test comment!")
 end


  # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

 puts "#{Post.last.title}"    
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"