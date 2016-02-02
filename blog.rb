require 'colorize'

class Post
	attr_reader :title, :text, :date
	def initialize(title,text,sponsored=false)
		
		@title = title
		@date = Time.now
		@text = text
		if sponsored
			@title = "******" + title + "******"
		end

	end
end

class Blog
	attr_reader :posts
	def initialize
		@posts = []
		@maxPostsPerPage = 3
		@pages = 0
		@currentPage = 1
	end

	def add_post(post)
		@posts << post
	end

	def publish_front_page
		@currentPage = 1
		self.publish_page
	end

	def next
		if @currentPage + 1 <= @pages
			@currentPage += 1
			self.publish_page
		else
			puts "No next page."
		end
	end

	def prev
		if @currentPage - 1 > 0
			@currentPage -= 1
			self.publish_page
		else
			puts "No previous page."
		end
	end

	def publish_page
		postNum = @maxPostsPerPage * (@currentPage-1)
		puts "postNum: #{postNum}"

		while postNum < (@maxPostsPerPage * @currentPage) && postNum < @posts.length do
			puts @posts[postNum].title
			puts "**************"
			puts @posts[postNum].text
			puts "----------------"
			postNum += 1
		end

		puts get_pages

	end
	def order_posts
		@posts.sort! {|x,y| y.date <=> x.date }
		
	end

	def get_pages
		i = 0

		while i < (@pages) do
			i += 1
			p = i.to_s
			if @currentPage == i
				p = "[#{p}]".colorize(:red)
			end
			footerString = "#{footerString} #{p}"
		end
		return footerString
	end

	def count_pages 
		@pages = (@posts.length / @maxPostsPerPage).round
	end

	def jump_to_page(page)
		if page.to_i > 0 and page.to_i <= @pages
			@currentPage = page.to_i
			self.publish_page
		else
			puts "Page #{page} does not exist."
		end

	end

	def main
		self.order_posts
		self.count_pages
		self.publish_front_page
		action = ""
		while true do
			action = gets.chomp
			#if action is 
			case action
			when "prev"
				self.prev
				
			when "next"
				self.next

			when "exit"
				break
			else
				if action.match(/[0-9]/) != nil
					self.jump_to_page(action)
				else
					puts "Please enter 'prev', 'next' or the page number to navigate, or 'exit' to close."
				end
			end 
		end
	end
end

blog = Blog.new
blog.add_post(Post.new('Post title 1','Post 1 text'))
blog.add_post(Post.new('Post title 2','Post 2 text',true))
blog.add_post(Post.new('Post title 3','Post 3 text'))
blog.add_post(Post.new('Post title 4','Post 4 text'))
blog.add_post(Post.new('Post title 5','Post 5 text',true))
blog.add_post(Post.new('Post title 6','Post 6 text'))
blog.add_post(Post.new('Post title 7','Post 7 text'))
blog.add_post(Post.new('Post title 8','Post 8 text'))
blog.add_post(Post.new('Post title 9','Post 9 text'))
blog.add_post(Post.new('Post title 10','Post 10 text'))
blog.add_post(Post.new('Post title 11','Post 11 text'))
blog.add_post(Post.new('Post title 12','Post 12 text'))
blog.add_post(Post.new('Post title 13','Post 13 text'))
blog.add_post(Post.new('Post title 14','Post 14 text'))
blog.add_post(Post.new('Post title 15','Post 15 text'))


blog.main
# blog.order_posts

