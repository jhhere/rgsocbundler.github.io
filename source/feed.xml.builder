xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "RGSoC Bundler Team Blog"
  xml.subtitle "Women Contributing to Open Source Software"
  xml.id "http://rgsocbundler.github.io/"
  xml.link "href" => "http://rgsocbundler.github.io/"
  xml.link "href" => "http://rgsocbundler.github.io/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.try(:date).try(:to_time).try(:iso8601)
  xml.author { xml.name "Jen Diamond" }
  xml.author { xml.name "Joyce Hsu" }
  xml.author { xml.name "Jessica Suttles" }

  blog.articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.url
      xml.id article.url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "RGSoCBundler" }
      # xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end
