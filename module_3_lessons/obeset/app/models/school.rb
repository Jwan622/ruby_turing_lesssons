class School

  def self.service
    @service ||= SchoolistService.new
  end

  def self.find(id)
    _build_object(service.school(id))
  end

  def self.all
    service.schools.map do |school|
      _build_object(school)
    end
  end

  def self.create(params)
    _build_object(service.create_school(params))
  end

  def self.destroy(id)
    service.destroy_school(id)
  end

  def self.update(id, params)
    service.update_school(id, params)
  end

  def self._build_object(data)
    OpenStruct.new(data)
  end
end
