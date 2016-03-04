class SchoolistService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://localhost:3000/v1")
    #faraday allows you to make http request to external services
  end

  def schools
    parse(connection.get("schools"))
  end

  def school(id)
    parse(connection.get("schools/#{id}"))
  end

  def destroy_school(id)
    connection.delete("schools/#{id}")
  end

  def create_school(params)
    parse(connection.post("schools", params))
  end
  # the above model is a school method that we can call on SchoolistService.new.school(1) and it'll give us the school id

  def update_school(id, params)
    connection.put("schools/#{id}", params)
  end
  
  private

  def parse(response)
    JSON.parse(response.body)
  end
end
