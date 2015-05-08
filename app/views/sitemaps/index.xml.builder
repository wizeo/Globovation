xml.instruct!
xml.urlset(
  'xmlns'.to_sym => "http://www.sitemaps.org/schemas/sitemap/0.9",
  'xmlns:image'.to_sym => "http://www.google.com/schemas/sitemap-image/1.1"
) do
  @static_pages.each do |page|
    xml.url do
      xml.loc "#{page}"
      xml.changefreq("weekly")
    end
  end
  @projects.each do |project|
    xml.url do
      xml.loc "#{projects_path(project)}"
      xml.lastmod post.updated_at.strftime("%F")
      xml.changefreq("daily")
    end
  end
end