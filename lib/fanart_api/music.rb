class FanartApi::Music < FanartApi::Base
  include Ov

  let :artist, Any do |id|
    artist(id: id)
  end

  let :artist, Hash do |options|
    artist_path_with_params(options).get
  end

  let :artist_url, Any do |id|
    artist_url(id: id)
  end

  let :artist_url, Hash do |options|
    artist_path_with_params(options).url
  end

  let :album, Any do |id|
    album(id: id)
  end

  let :album, Hash do |options|
    album_path_with_params(options).get
  end

  let :album_url, Any do |id|
    album_url(id: id)
  end

  let :album_url, Hash do |options|
    album_path_with_params(options).url
  end

  let :label, Any do |id|
    label(id: id)
  end

  let :label, Hash do |options|
    label_path_with_params(options).get
  end

  let :label_url, Any do |id|
    label_url(id: id)
  end

  let :label_url, Hash do |options|
    label_path_with_params(options).url
  end

  let :latest do |date|
    latest({})
  end

  let :latest, Any do |date|
    latest(date: date)
  end

  let :latest, Hash do |options|
    latest_path_with_params(options).get
  end

  let :latest_url do |date|
    latest_url({})
  end

  let :latest_url, Any do |date|
    latest_url(date: date)
  end

  let :latest_url, Hash do |options|
    latest_path_with_params(options).url
  end

  private

  def artist_path_with_params(options)
    path_with_params(find_path, options.merge(kind: :music))
  end

  def album_path_with_params(options)
    path_with_params(album_path, options.merge(kind: :music))
  end

  def label_path_with_params(options)
    path_with_params(label_path, options.merge(kind: :music))
  end

  def latest_path_with_params(options)
    path_with_params(latest_path, options.merge(kind: :music))
  end

  def album_path
    ':kind/albums/:id'
  end

  def label_path
    ':kind/labels/:id'
  end
end
