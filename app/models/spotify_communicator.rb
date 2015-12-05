class SpotifyCommunicator

  def initialize(verb, token, endpoint, args = {})
    @verb = verb
    @token = token
    @endpoint = endpoint
    @args = args
  end

  def call_spotify
    uri = URI(format_endpoint)
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = "Bearer #{@token}"
  end

  private

  def format_endpoint
  end

  def create_request
    case @verb.downcase
    when "get" then Net::HTTP::Get.new(uri)
    when "post" then Net::HTTP::Post.new(uri)
    when "put" then Net::HTTP::Put.new(uri)
    when "delete" then Net::HTTP::Delete.new(uri)
    else raise ArgumentError.new("Incorrect verb given to SpotifyCommunicator")
    end
  end

end
