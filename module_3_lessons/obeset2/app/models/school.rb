class School

  def self.service
    @service ||= SchoolistService.new
  end

  def self.all
    service.schools.map do |school|
      build_object(school)
    end
  end

  def self.find(id)
    build_object(service.school(id))
  end

  private

  def self.build_object(data)
    OpenStruct.new(data)
  end
end
