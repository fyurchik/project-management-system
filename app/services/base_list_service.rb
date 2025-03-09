class BaseListService
  attr_reader :params

  def self.call(params)
    new(params).call
  end

  def initialize(params)
    @params = params
  end

  def call
    raise NotImplementedError, "Subclasses must implement the 'call' method."
  end

  private

  def resource_class
    subclass_name = self.class.to_s
    resource_name = subclass_name.split("::").reject { |name| name == "List" }.join("::")
    resource_name.constantize
  end
end
