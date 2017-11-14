module MoveRules

  def in_bounds?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0,7)
  end

  def add_shift(pos, shift)
    [pos[0] + shift[0], pos[1] + shift[1]]
  end

end
