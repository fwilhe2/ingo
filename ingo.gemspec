Gem::Specification.new do |s|
  s.name = 'ingo'
  s.version = '0.0.1.unreleased'
  s.licenses = ['MIT']
  s.summary = 'A static site generator built on Asciidoctor'
  s.description = 'Ingo converts AsciiDoc files in a directory and converts them using Asciidoctor. It is built for collecting notes in AciiDoc format and presenting them.'
  s.authors = ['Florian Wilhelm']
  s.email = 'florian-wilhelm@onlinehome.de'
  s.files = %w(bin/ingo lib/ingo.rb README.adoc CHANGELOG.adoc LICENSE)
  s.homepage = 'https://gitlab.com/fwilhe/ingo'
  s.add_runtime_dependency 'asciidoctor', '~> 1.5'
  s.bindir = 'bin'
  s.executables << 'ingo'
end
