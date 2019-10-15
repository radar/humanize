module Humanize
  %w[az de en es fr id pt ru th tr ms].each do |locale|
    autoload locale.capitalize.to_sym, "humanize/locales/#{locale}.rb"
  end
end
