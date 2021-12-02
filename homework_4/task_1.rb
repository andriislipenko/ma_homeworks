require './task_2'

class BricksFactory
  COLORS = [
    'red',
    'green',
    'blue'
  ]

  extend Sortable

  @serial_number = 0
  @unbroken_bricks = []

  class << self
    attr_accessor :serial_number, :unbroken_bricks
    private :serial_number=, :unbroken_bricks=

    def create(count = 1)
      raise 'Enter positive count' if count < 1
      count.times.collect { create_brick }
    end

    def unbroken_count
      unbroken_bricks.size
    end

    def recent_unbroken(color)
      raise 'Enter valid color' unless COLORS.include?(color)
      unbroken_bricks.select { |brick| brick.color == color }.last(10)
    end

    def sorted_unbroken
      unbroken_bricks.sort_by(&:color)
    end

    private

    def create_brick
      brick = Brick.new(COLORS[rand(3)], serial_number)

      unless brick.broken?
        unbroken_bricks << brick
        self.serial_number += 1
      end

      brick
    end

    alias sorted_unbroken sort_by
  end
end

class Brick
  BREAK_CHANCE = 20
  STATES = {
    fine: 'fine',
    broken: 'broken'
  }

  attr_reader :color, :serial_number

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

BricksFactory.create
BricksFactory.create 20
BricksFactory.unbroken_count
BricksFactory.recent_unbroken('red')
p BricksFactory.sorted_unbroken(BricksFactory.unbroken_bricks, :color)
