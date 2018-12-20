%w[az de en fr id th tr].each do |locale|
  require_relative "locales/#{locale}"
end
