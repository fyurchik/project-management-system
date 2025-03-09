module AdditionalHooks
  def expectations(&block)
    after(:each, &block)
  end
end
