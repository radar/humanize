module Humanize
  %w[az de en es fr id pt ru sv th tr].each do |locale|
    autoload locale.capitalize.to_sym, "humanize/locales/#{locale}.rb"
  end
end
