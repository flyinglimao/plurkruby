Gem::Specification.new do |s|
  s.name        = "plurkruby"
  s.version     = "0.1.0"
  s.date        = "2020-03-15"
  s.summary     = "Plurk client"
  s.description = "A Plurk client provide module and class"
  s.authors     = ["Bill Wu"]
  s.email       = "hi@limaois.me"
  s.files       = [
                    "lib/plurk.rb",
                    "lib/plurk/emoticon.rb",
                    "lib/plurk/profile.rb",
                    "lib/plurk/response.rb",
                    "lib/plurk/timeline.rb",
                    "lib/plurk/user.rb",
                    "lib/plurk/utils.rb"
                  ]
  s.homepage    = "https://limaois.me/plurkruby"
  s.license     = "MIT"
  s.add_runtime_dependency "oauth"
end
