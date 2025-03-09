class Base
  attr_accessor :errors

  def initialize
    @errors = {}
  end

  private

  def with_transaction
    ActiveRecord::Base.transaction do
      yield

      raise ActiveRecord::Rollback if errors.any?
    end
  end

  def collect_errors(*resources)
    resources.each do |resource|
      if resource.errors.any?
        errors[resource.class.name.downcase.to_sym] = resource.errors.messages.transform_values(&:uniq)
      end
    end
  end
end
