# frozen_string_literal: true

# instructions to make the hidden code
class CodeMaker
  attr_reader :code

  def initialize
    @code = []
    @colors = %w[red orange yellow green blue violet]
  end

  def random_code
    4.times { @code.push(@colors.sample) }
  end
end

class CodeBreaker
end

secret = CodeMaker.new
secret.random_code
puts secret.code
