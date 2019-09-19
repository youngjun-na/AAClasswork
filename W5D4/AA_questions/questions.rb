require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end
# -------------------------------------------
# -------------------------------------------
# -------------------------------------------
class User
  attr_accessor :fname, :lname, :id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def initialize(people)
    @id = people['id']
    @fname = people['fname']
    @lname = people['lname']
  end

  def authored_questions
    Question.find_by_author_id(id)
  end

  def authored_replies
    Reply.find_by_user_id(id)
  end

end
# -------------------------------------------
# -------------------------------------------
# -------------------------------------------
class Question
  attr_accessor :id, :title, :body, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end

  def self.find_by_title(title)
    questions = QuestionsDatabase.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        questions
      WHERE
        title = ? 
    SQL
    questions.map { |question| Question.new(question) }
  end

   def self.find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ? 
    SQL
    questions.map { |question| Question.new(question) }
  end

  def initialize(qs)
    @id = qs['id']
    @title = qs['title']
    @body = qs['body']
    @author_id = qs['author_id']
  end

  def author  
    names = User.find_by_id(@author_id)
    names.fname + " " + names.lname
  end

  def replies
    all = Reply.find_by_question_id(@id)
    all.map {|ele| ele.body}
  end
end
# -------------------------------------------
# -------------------------------------------
# -------------------------------------------
class Follow
  attr_accessor :id, :users_id, :questions_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| Follow.new(datum) }
  end

  def self.find_by_id(id)
    follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    return nil unless follow.length > 0

    Follow.new(follow.first)
  end

  def self.followers_for_question_id(questions_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, questions_id)
      SELECT
        *
      FROM
        users JOIN question_follows ON users.id = question_follows.users_id
      
      WHERE
        questions_id = ?
   
    SQL
    users.map {|user| User.new(user)}
  end

  # def self.find_by_name(fname, lname)
  #   user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
  #     SELECT
  #       *
  #     FROM
  #       users
  #     WHERE
  #       fname = ?, lname = ?
  #   SQL
  #   return nil unless user.length > 0

  #   User.new(user.first)
  # end

  def initialize(follows)
    @id = follows['id']
    @questions_id = follows['questions_id']
    @users_id = follows['users_id']
  end

end
# -------------------------------------------
# -------------------------------------------
# -------------------------------------------
class Reply
  attr_accessor :id, :question_id, :parent_id, :author_id, :body

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def self.find_by_user_id(author_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
    SQL

    replies.map {|reply| Reply.new(reply)}
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    replies.map {|reply| Reply.new(reply)}
  end

  def initialize(response)
    @id = response['id']
    @question_id = response['question_id']
    @parent_id = response['parent_id']
    @author_id = response['author_id']
    @body = response['body']
  end

  def author
    names = User.find_by_id(@author_id)
    names.fname + " " + names.lname
  end

  def question
    question = Question.find_by_id(@question_id)
    question.body
  end



end
# -------------------------------------------
# -------------------------------------------
# -------------------------------------------
class Like
  attr_accessor :id, :question_id, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    return nil unless like.length > 0

    Like.new(like.first)
  end

  # def self.find_by_name(fname, lname)
  #   user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
  #     SELECT
  #       *
  #     FROM
  #       users
  #     WHERE
  #       fname = ?, lname = ?
  #   SQL
  #   return nil unless user.length > 0

  #   User.new(user.first)
  # end

  def initialize(upvote)
    @id = upvote['id']
    @question_id = upvote['question_id']
    @user_id = upvote['user_id']
  end

end