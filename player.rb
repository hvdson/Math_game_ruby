# --------------------------------
# Player (state)
  # initialized with 3 lives

  # METHODS:
  # lives is readable and writable
  # name is readable
# --------------------------------
class Player
  attr_accessor :lives
  attr_reader :name

  def initialize(name)
    @name = name
    @lives = 3
  end
end