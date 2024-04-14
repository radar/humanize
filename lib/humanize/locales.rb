module Humanize
  %w[az de en es fr fr_ch id ms pt ru th tr jp vi zh_tw].each do |locale|
    autoload locale.split('_').map(&:capitalize).join.to_sym, "humanize/locales/#{locale}.rb"
  end
end
