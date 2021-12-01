class BricksFactory
  COLORS = [
    'red',
    'green',
    'blue'
  ]

  @serial_number = 0
  @bricks = []

  class << self
    attr_accessor :serial_number, :bricks
    private :serial_number=, :bricks=

    def create
      brick = Brick.new(COLORS[rand(3)], serial_number)
      bricks << brick

      self.serial_number += 1 unless brick.broken?

      brick
    end
  end
end

class Brick
  BREAK_CHANCE = 20
  STATES = {
    fine: 'fine',
    broken: 'broken'
  }

  def initialize(color, serial_number)
    @color = color
    @state = define_state
    @serial_number = serial_number unless broken?
  end

  def broken?
    @state == STATES[:broken]
  end

  private

  def define_state
    (rand(100) + 1) > 20 ? STATES[:fine] : STATES[:broken]
  end
end

p BricksFactory.create
p BricksFactory.create
p BricksFactory.create
