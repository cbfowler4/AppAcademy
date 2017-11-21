class QuestionLike
  attr_accessor :liked

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLike.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @liked = options['liked']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def create
    raise "#{self} is already in the database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @user_id, @question_id, @liked)
      INSERT INTO
        question_likes(user_id, question_id, liked)
      VALUES
        (?, ?, ?)
    SQL

    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} is not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @user_id, @question_id, @liked)
    UPDATE
      question_likes
    SET
      user_id = ?, question_id = ?, liked = ?
    WHERE
      id = ?
    SQL
  end

  def self.likers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_likes ON question_likes.user_id = users.id
      WHERE
        question_likes.question_id = ? AND question_likes.liked = 1
    SQL

    return nil if users.length < 1
    users.map {|datum| User.new(datum)}
  end

  def self.num_likes_for_question_id(question_id)
    num = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(question_likes.question_id)
      FROM
        question_likes
      WHERE
        question_likes.question_id = ? AND question_likes.liked = 1
      GROUP BY
        question_likes.question_id
    SQL
    num[0].values.first
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN
        question_likes ON question_likes.question_id = questions.id
      WHERE
        questions.user_id = ? AND question_likes.liked = 1
    SQL

    return nil if questions.length < 1
    questions.map {|datum| Question.new(datum)}
  end

  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        questions
      JOIN
        question_likes ON question_likes.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY COUNT(question_likes.question_id)
      LIMIT ?
    SQL

    questions.map { |datum| Question.new(datum) }
  end

end
