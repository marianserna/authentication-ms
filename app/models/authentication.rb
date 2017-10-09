class Authentication

  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def authenticate
    raise params.inspect
  end
end
