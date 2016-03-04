class SchoolistService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://localhost:3000/v1")
  endz

  def schools
    parse(connection.get("schools"))
  end

  def school(id)
    parse(connection.get("schools/#{id}"))
  end

  private

  def parse(json_data)
    JSON.parse(json_data.body)
  end

end
