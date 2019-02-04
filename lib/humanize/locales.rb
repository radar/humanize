%w[az de en fr id ru th tr].each do |locale|
  require_relative "locales/#{locale}"
end
