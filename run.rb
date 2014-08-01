require 'erb'

pages = ['index', 'gallery', 'buy', 'rent', 'contact']
templates = {}
content = {}
def menu(page)
  page ||= 'index'

  content = "<div class = 'menu'>\n"
  content += "  <a href = 'index.html' #{active(page, 'index')}>Home</a>\n"
  content += "  <a href = 'buy.html' #{active(page, 'buy')}>Buy Domes</a>\n"
  content += "  <a href = 'rent.html' #{active(page, 'rent')}>Rent Domes</a>\n"
  content += "  <a href = 'gallery.html' #{active(page, 'gallery')}>Gallery</a>\n"
  content += "  <a href = 'contact.html' #{active(page, 'contact')}>Contact</a>\n"
  content += "</div>"

  content

end

def active(page, active_page)
  if page == active_page
    "class = 'active'"
  else
    ""
  end
end

#clear out the folder
`rm public/*.html`

#generate pages here
for page in pages
  templates[page] = ERB.new(File.new("#{page}.html.erb").read, nil, '%').result
  content[page] = ERB.new(File.new("layout.html.erb").read, nil, '%').result(binding)
  File.open("public/#{page}.html", 'w') { |file| file.write(content[page]) }
end


