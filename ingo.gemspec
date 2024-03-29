Gem::Specification.new do |s|
  s.name = 'ingo'
  s.version = File.read('VERSION') + Time.now.getutc.to_i.to_s
  s.licenses = ['MIT']
  s.summary = 'A static site generator built on Asciidoctor'
  s.description = 'Ingo converts AsciiDoc files in a directory and converts them using Asciidoctor. It is built for collecting notes in AciiDoc format and presenting them.'
  s.authors = ['Florian Wilhelm']
  s.email = 'florian-wilhelm@onlinehome.de'
  s.files = %w(bin/ingo lib/ingo.rb README.adoc CHANGELOG.adoc LICENSE VERSION)
  s.homepage = 'https://github.com/fwilhe2/ingo'
  s.add_runtime_dependency 'asciidoctor', '~> 2.0.10'
  s.bindir = 'bin'
  s.executables << 'ingo'
end
