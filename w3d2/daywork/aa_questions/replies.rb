
class Reply
  attr_accessor :body, :parent_id
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @parent_id = options['parent_id']
    @question_id = options['question_id']
    @body = options['body']
  end

  def create
    raise "#{self} is already in the database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @user_id, @question_id, @body, @parent_id)
      INSERT INTO
        replies(user_id, question_id, body, parent_id)
      VALUES
        (?, ?, ?, ?)
    SQL

    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} is not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @user_id, @question_id, @parent_id, @body, @id)
    UPDATE
      replies
    SET
      user_id = ?, question_id = ?, parent_id = ?, body = ?
    WHERE
      id = ?
    SQL
  end

  def self.find_by_user_id(user_id)
    replies_of_user = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
      SQL

    replies_of_user.map { |datum| Reply.new(datum) }
  end

  def self.find_by_question_id(question_id)
    replies_of_question = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
      SQL

    replies_of_question.map { |datum| Reply.new(datum) }
  end

  def author
    author_obj = QuestionsDatabase.instance.execute(<<-SQL, @user_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    User.new(author_obj.first)
  end


  def question
    question_obj = QuestionsDatabase.instance.execute(<<-SQL, @question_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    Question.new(question_obj.first)
  end

  def parent_reply
    raise "#{self} does not have a parent" if @parent_id.nil?
    parent_reply_obj = QuestionsDatabase.instance.execute(<<-SQL, @parent_id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
      SQL

    Reply.new(parent_reply_obj.first)
  end

  def child_replies
    child_reply_obj = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
      SQL
    raise "#{self} does not have any children" unless child_reply_obj.length > 0

    child_reply_obj.map {|datum| Reply.new(datum) }
  end

  def save
    @id ? update : create
  end

end
