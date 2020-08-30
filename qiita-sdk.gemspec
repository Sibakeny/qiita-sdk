require_relative 'lib/qiita/sdk/version'

Gem::Specification.new do |spec|
  spec.name          = 'qiita-sdk'
  spec.version       = Qiita::Sdk::VERSION
  spec.authors       = ['sibakeny']
  spec.email         = ['sbkn0919@gmail.com']

  spec.summary       = 'qiita sdk for ruby'
  spec.description   = 'qiita sdk for ruby'
  spec.homepage      = 'https://gitlab.com/sibakeny/qiita-sdk'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://gitlab.com/sibakeny/qiita-sdk'
  spec.metadata['changelog_uri'] = 'https://gitlab.com/sibakeny/qiita-sdk'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
